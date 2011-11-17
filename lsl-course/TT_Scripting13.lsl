//llDialog(key avatar, string mensaje, list botones, integer canal) - Envía un menú al avatar designado, conteniendo un mensaje, y una serie de botones cuya opción pulsada se enviará por un canal.

//llSetTimerEvent(float segundos) - Dispara el evento timer() dentro de una cantidad determinada de segundos, periódicamente, hasta que se desactive (manualmente).

integer controlListen;

default {

    touch_start(integer total_number) {
        llDialog(llDetectedKey(0), "Escoge una opción:", ["Uno", "Dos"], 2);
        controlListen = llListen(2, "", llDetectedKey(0), "");
        llSetTimerEvent(20);
    }
    
    listen(integer chan, string nombre, key id, string mensaje) {
        llListenRemove(controlListen);
        llSetTimerEvent(0);
        
        if(mensaje=="Uno") {
            llSay(0, "Elegiste la primera opción.");
        } 
        else if(mensaje=="Dos") {
            llSay(0, "Elegiste la segunda opción.");
        }
    }
    
    timer() {
        llSetTimerEvent(0);
        llListenRemove(controlListen);
        llSay(0, "Diálogo expirado. Toque otra vez el prim para empezar.");
    }
    
}
