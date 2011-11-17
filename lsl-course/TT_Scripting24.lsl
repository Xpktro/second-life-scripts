//llPlaySound(string sonido, float volumen)
//llTriggerSound(string sonido, float volumen)
//llCollisionSound(string sonido, float volumen)
//-------
//llLoopSound(string sonido, float volumen)
//-------
//llStopSound()
//-------
//llPreloadSound(string sonido)
//-------
//llTriggerSoundLimited(string sonido, float volumen, vector esquina_noreste, vector esquina_suroeste)
//llSetSoundQueueing(integer activar)

default {
    state_entry() {
        llCollisionSound(llGetInventoryName(INVENTORY_SOUND, 0), 1.0);
        //llLoopSound(llGetInventoryName(INVENTORY_SOUND, 1), 0.4);
        llPreloadSound(llGetInventoryName(INVENTORY_SOUND, 2));
    }

    touch_start(integer total_number) {
        /*llStopSound();
        llTriggerSound(llGetInventoryName(INVENTORY_SOUND, 2), 1.0);
        llSleep(1);
        llSetPos(llGetPos() + <0,0,10>);
        llSleep(4);
        llSetPos(llGetPos() - <0,0,10>);*/
        llTriggerSoundLimited(llGetInventoryName(INVENTORY_SOUND, 2), 1.0, llGetPos()+<3, 3, 3>, llGetPos()+<-3, -3, -3>);
    }
}
