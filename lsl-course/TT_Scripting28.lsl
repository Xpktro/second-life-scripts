//llEmail(string direccion, string asunto, string cuerpo)
//(UUID)@lsl.secondlife.com
//llGetKey()
//------------------------------------------------------
//llGetNextEmail(string direccion, string asunto)
//------------------------------------------------------
//llParseString2List(string texto, list separadores, list espaciadores)
//-------------------------------------------------------
//llInstantMessage(key avatar, string mensaje)

default {
    state_entry() {
        //llEmail("direccion@cualquier.com", "Prueba de llEmail", "Si estás leyendo esto, llEmail sucedió satisfactoriamente.");
        llSay(0, "Envíame un mail a: " + (string)llGetKey() + "@lsl.secondlife.com");
        llSetTimerEvent(1.0);
    }
    
    timer() {
        llGetNextEmail("", "");
    }
    
    email(string tiempo, string direccion, string asunto, string cuerpo, integer restantes) {
        llSay(0, asunto);
        list resultados = llParseString2List(cuerpo, ["\n\n"], []);
        llSay(0, llList2String(resultados, 1));
        if(restantes > 0) llGetNextEmail("", "");
    }
}

//---------------------------------------------------
/*
default {
    touch_start(integer total_number) {
        llEmail("UUID@lsl.secondlife.com", "Prueba de llEmail", "Si estás leyendo esto, llEmail sucedio satisfactoriamente.");
    }
}
*/