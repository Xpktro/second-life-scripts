//vector llDetectedTouchUV(integer numero)
vector toque;


default {
    touch_start(integer total_number) {        
        //llSay(0, "Inicia presión.");
        toque = llDetectedTouchUV(0);
        if(toque.x > 0.5) {
            llSay(0, "Tocaste la mitad derecha.");
        } else {
            llSay(0, "Tocaste la mitad izquierda.");
        }
    }
    
    touch(integer numero) {
       //llOwnerSay((string)llDetectedTouchUV(0));
       //llSay(0, "Presión.");
    }
    
    touch_end(integer numero) {
        //llSay(0, "Fin de la presión.");
    }
}
