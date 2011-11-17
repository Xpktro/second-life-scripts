//llAddToLandBanList(key avatar, float horas)
//llRemoveFromLandBanList(key avatar)
//llResetLandBanList()
//-----------------------
//llAddToLandPassList(key avatar, float horas)
//llRemoveFromLandPassList(key avatar)
//llResetLandPassList()
//-----------------------
//llEjectFromLand(key avatar)
//llTeleportAgentHome(key avatar)
//-----------------------
//integer llOverMyLand(key avatar)

list acceso = ["Lupercus Eyre"];

default {
    state_entry() {
        llSensorRepeat("", NULL_KEY, AGENT, 32.0, 2*PI, 1.0);
        llSetText("No me toques!", <1,1,1>, 1.0);
    }

    sensor(integer num) {
        integer cont = 0;
        for(; cont<num; cont++) {
            if(llListFindList(acceso, [llDetectedName(cont)]) != -1) {
                llAddToLandPassList(llDetectedKey(cont), 1.0);
            }
        }
    }
    
    touch_start(integer n) {
        llEjectFromLand(llDetectedKey(0));
    }
    
}
