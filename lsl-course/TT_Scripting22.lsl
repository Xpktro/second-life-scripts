//llCollisionFilter(string nombre, key id, integer aceptar)
//llSetStatus(integer status, integer valor)
//llVolumeDetect(integer detectar)

default {
    state_entry() {
        llCollisionFilter("", NULL_KEY, TRUE);
        llSetStatus(STATUS_PHANTOM, TRUE);
        llVolumeDetect(TRUE);
    }
    
    collision_start(integer numero) {
        llSay(0, "Ouch " + llDetectedName(0));
    }

    collision_end(integer numero) {
        llSay(0, "Yay " + llDetectedName(0));
    }
    
    collision(integer numero) {
        llSay(0, "->" + llDetectedName(0));
    }

}
