//key llGetNotecardLine(string nombre, integer linea) - Envía una petición para obtener cierta linea de una notecard, disparando el evento dataserver.
//key llGetNumberOfNotecardLines(string nombre) - Envía una petición para obtener el número de lineas de una notecard, disparando el evento dataserver.
//integer llSubStringIndex(string cadena, string datos) - Devuelve la posición en la que se encuentra una serie de datos, al ser buscados en una cadena.
//list llParseString2List(string datos, list separadores, list espaciadores) - Divide un string en una lista de acuerdo a dos criterios, de separadores o espaciadores.
//BONUS!: llUnSit(key avatar) - Levantar a un avatar que está sentado en el objeto, sabiéndose su key.


vector color;
float transp;
key kRequest;
integer contador;

default {
    state_entry() {
        contador = 0;
        kRequest = llGetNotecardLine("config", contador);
    }

    dataserver(key peticion, string datos) {
        if(peticion == kRequest) {
            if(datos != EOF) { //mientras no se lea el final de la notecard
                if(llSubStringIndex(datos, "//") != 0 || datos!="") {
                    list parValores;
                    parValores = llParseString2List(datos, ["="], []);
                    if(llList2String(parValores, 0)=="color") {
                        if(llList2String(parValores, 1)=="rojo") {
                            color = <1, 0, 0>;
                        }
                        if(llList2String(parValores, 1)=="verde") {
                            color = <0, 1, 0>;
                        }
                        if(llList2String(parValores, 1)=="azul") {
                            color = <0, 0, 1>;
                        }                        
                    }
                    if(llList2String(parValores, 0)=="transparencia") { 
                        transp = llList2Float(parValores, 1);
                    }
                }
                contador++;
                kRequest = llGetNotecardLine("config", contador);
            } else {
                llSay(0, "Terminada de leer la notecard.");
                state funcion;
            }
        }
    }
    
    changed(integer cambio) {
        if(cambio & CHANGED_INVENTORY) {
            llResetScript();
        }
    }

}

state funcion {
    state_entry() {
        llSetColor(color, ALL_SIDES);
        llSetAlpha(transp, ALL_SIDES);
    }
    
    changed(integer cambio) {
        if(cambio & CHANGED_INVENTORY) {
            llResetScript();
        }
    }
}
