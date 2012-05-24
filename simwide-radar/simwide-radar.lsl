// Tiaeld Tolsen @ TT Industries - llGetAgentList sim-wide radar/Radar de todo el sim de llGetAgentList

//Based in the new llGetAgentList LSL Function (https://jira.secondlife.com/browse/SVC-6427) this is a little gadget capable to work as an (almost)zero-lag sim-wide radar. Currently, llGetAgentList is only available on the 3 RC Simulator Channels (Magnum, BlueSteel, LeTigre) and it will be hopely deployed for the rest of the grid in a couple of days.
//This script can't be sold and any variation of it must contain my name as the original creator.
//----------------------------------------------------------------------------------
//Basado en la nueva función de LSL llGetAgentList (https://jira.secondlife.com/browse/SVC-6427) este pequeño aparato puede funcionar como un radar para todo el sim con (casi) cero lag. Actualmente, llGetAgentList sólo está disponible en los 3 canales RC (Magnum, BlueSteel, LeTigre) y esperemos que sea repartido al resto del grid en un par de días.
//Este script no puede ser vendido y cualquier variación del mismo debe contener mi nombre como el creador original.


//We'll need this later / Necesitaremos esto después
list lTemp;
list lTemp2;
integer iTemp;
integer iPrims;
integer iOn;


//WARNING: Not-so begineer-scripter friendly code ahead, be careful.
//CUIDADO: Código no tan amigable para scripters novatos adelante, tener cuidado.

clean() { //We clean the remaining cells. / Limpiamos las celdas restantes.
	llSetLinkPrimitiveParamsFast(LINK_ALL_OTHERS, [PRIM_TEXT, "", <1., 1., 1.>, 1.]);
}

default {
	state_entry() {
		clean();
		llSetText("TT Industries\nSimwide Radar\nOFF", <1., .2, .2>, 1.);
		
		//We'll need this to iterate across all the prims.
		//Necesitaremos esto para recorrer todos los prims.
		iPrims = llGetNumberOfPrims();
	}
	
	touch_start(integer n) {
		if(iOn = !iOn) {
			llOwnerSay("Radar ON");
			llSetText("TT Industries\nSimwide Radar\nON", <.6, .8, 0.>, 1.);
			
			//This is a reasonable time to the script to do it's job.
			//Es un tiempo razonable para dejar trabajar al script.
			llSetTimerEvent(.2);
		} else {
			llOwnerSay("Radar OFF");
			llSetText("TT Industries\nSimwide Radar\nOFF", <1., .2, .2>, 1.);
			llSetTimerEvent(0.);
			clean();
		}
	}
	
	timer() {
		//This is where magic start, thanks to the new llGetAgentList.
		//Aquí empieza la magia, gracias al nuevo llGetAgentList.
		lTemp = (lTemp = []) + (lTemp2 = []) + llGetAgentList(AGENT_LIST_REGION, []);
		iTemp = lTemp!=[];
		
		//In case we got some kind of error, stop everything.
		//En caso de tener algún error, paramos todo.
		if(llGetListEntryType(lTemp, 0)==TYPE_STRING) {
			llOwnerSay("Error: " + llList2String(lTemp, 0));
			iOn = FALSE;
			llSetTimerEvent(0.);
			return;
		}
		
		//We start filling our new list with the name and distance from ourselves.
		//Empezamos llenando nuestra nueva lista con los nombres y la distancia hacia nosotros.
		while(iTemp--) 
			lTemp2 = [llVecDist(llList2Vector(llGetObjectDetails(llList2Key(lTemp, iTemp), [OBJECT_POS]), 0), llGetPos()), llKey2Name(llList2Key(lTemp, iTemp))] + lTemp2;
			
		//Since results are unsorted, we sort them.
		//Ya que los resultados están desordenados, los ordenamos.
		lTemp2 = llListSort(lTemp2, 2, TRUE);
		
		//If there are more results than cells, we cap their number.
		//Si hay más resultados que celdas, cortamos su número.
		if((iTemp = lTemp!=[]) > iPrims) iTemp = iPrims;
		
		//We start drawing every cell with our info.
		//Empezamos a dibujar cada celda con nuestra información
		while(--iTemp) 
			llSetLinkPrimitiveParamsFast(iTemp+1, [PRIM_TEXT, llList2String(lTemp2, (iTemp*2)+1) + ": " + (string)llList2Integer(lTemp2, iTemp*2) + " m.",<1., 1., 1.>, 1.]);
		
		//We clean remaining cells in linkset.
		//Limpiamos las celdas restantes en el linkset.
		iTemp = lTemp!=[];
		while(iTemp++ < iPrims)
			llSetLinkPrimitiveParamsFast(iTemp,[PRIM_TEXT, "", <1., 1., 1.>, 1.]);
	}
	
	//Update the interface in case we need it.
	//Limpiamos la interface en caso lo necesitemos.
	on_rez(integer s) {
		clean();
	}
	
	changed(integer change) {
		if(change & CHANGED_REGION) clean();
		else if(change & CHANGED_LINK) iPrims = llGetNumberOfPrims();
	}
}