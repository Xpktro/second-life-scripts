// a % b = residuo de la división entera
// a % 2 = 0 - Número par

integer cont = 0;

float a = 1.0;
float b = 1.0;
float c = 1.0;


//integer llListen(interger chan, string nombre, key id, string mensaje); - Crea un listener en el canal indicado, siguiendo el nombre del objeto, key o mensaje definidos, disparando el evento listen.
//NULL_KEY - Pasarlo a llListen para generar eventos listen de cualquier objeto, indistintamente del key que tenga.

//llListenRemove(integer numero) - Desactiva un listener recibiendo como parámetro el número generado al momento de crear el listen con llListen

integer manejadorListen;

default {
    state_entry() {
        //llListen(2, "", llGetOwner(), "");
        manejadorListen = llListen(0, "", NULL_KEY, "");
    }
    
    listen(integer chan, string nombre, key id, string mensaje) {
        //llSay(0, mensaje + " (dicho en el canal " + (string)chan + ")");
        if(llToLower(mensaje)=="hola") {
            llSay(0, "Hola " + nombre + "!");
        }
    }

    touch_start(integer total_number) {
        /*for(cont = 0; cont<6; cont++) {
            if(cont%2 == 0 && cont != 0) { //Numero par
                llSetColor(<a, b, c>, cont);
                llSay(0, "Pintando cara: " + (string)cont);
            }
        }*/
        
        llSay(0, "Desactivando listener...");
        llListenRemove(manejadorListen);
    }
}