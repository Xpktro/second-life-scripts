//llSitTarget cambia la posición del avatar sentado en el objeto
//llForceMouselook fuerza la vista subjetiva en el avatar sentado en el objeto
// llToLower / llToUpper reciben un dato de tipo string, para convertilos en strings en minúsculas completamente o mayúsculas
//llShout - Grita - 100m
//llWhisper - Susurra - 10m
          //FALSE
integer a = TRUE;

integer suma(integer a, integer b) {
    integer s = a + b;
    return s;
}

diOtraCosa(string mensaje) {
    llSay(0, "otra cosa");
    llShout(0, mensaje);
}

inicializar() {
    llSitTarget(<0.0, 0.0, 1.0>, ZERO_ROTATION);
    llForceMouselook(a);
    llSetClickAction(CLICK_ACTION_SIT);
}

default
{
    state_entry()
    {
        inicializar();
    }
    
    touch_start(integer num_detected) {
        string mensaje = "MENSAJE EN MINÚSCULAS";
        
        llSay(0, llToLower(mensaje));
        llSay(0, (string)suma(5,5));
        diOtraCosa("estoy gritando");
        state dos;
    
    }

}


state dos {

    touch_start(integer num) {
        diOtraCosa("no me toquen!");
        state default;
    }
}