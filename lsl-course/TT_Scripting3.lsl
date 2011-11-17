//llDetectedName(0) devuelve el nombre del avatar que está tocando
//llGetObjectName() devuelve el nombre del objeto que tiene el script
//llSetAlpha(0.0, ALL_SIDES) cambia la transparencia del objeto en base a sus caras
//llOwnerSay() envía mensajes sólo al dueño del objeto

//BONUS!!!: llSetClickAction
//CLICK_ACTION_SIT
//CLICK_ACTION_BUY
//CLICK_ACTION_PAY
//CLICK_ACTION_OPEN
//CLICK_ACTION_NONE
//CLICK_ACTION_TOUCH
//---
//CLICK_ACTION_PLAY
//CLICK_ACTION_OPEN_MEDIA
//---


integer numero;

default {

    state_entry() {
        llSetClickAction(CLICK_ACTION_SIT);
        llSleep(20);
        llSetClickAction(CLICK_ACTION_TOUCH);
    }
    
    touch_start(integer total_number) {
        
        llOwnerSay(llDetectedName(0) + " apagó al objeto llamado " + llGetObjectName());
        llSetAlpha(0.0, ALL_SIDES);
        
        numero = numero + 1;
        llSetText((string)numero, <1 , 1, 1>, 1.0);
        
        state apagado; //Salto al siguiente estado (apagado)
        
    }
}


state apagado { 

    touch_start(integer total_number) {
    
        llOwnerSay(llDetectedName(0) + " enciende al objeto llamado " + llGetObjectName());
        llSetAlpha(1.0, ALL_SIDES);
        
        numero = numero + 1;
        llSetText((string)numero, <1 , 1, 1>, 1.0);
        
        state default; //Salto al estado default
        
    } 
}