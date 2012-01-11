//float llGetMass()
//float llGetEnergy()
//float llGetObjectMass(key id)
//llSetStatus(integer propiedad, integer valor)
//STATUS_PHYSICS
//-----------------------------------------------
//llApplyImpulse(vector magnitud, integer local)
//llSetForce(vector magnitud, integer local)
//llApplyRotationalImpulse(vector magnitud, integer local)
//llSetTorque(vector magnitud, integer local)
//local = TRUE -> coordenadas del objeto
//local = FALSE -> coordenadas del simulador
//----------------------------------------------
//llMoveToTarget(vector posicion, float tiempo)
//llStopMoveToTarget()
//integer llTarget(vector posicion, float rango) dispara el evento at_target
//llTargetRemove(integer id)
//not_at_target()
//----------------------------------------------
//llSetBuoyancy(float numero)
//numero == 0.0 -> termina el efecto
//numero < 1.0 -> descender
//numero == 1.0 -> flotar
//numero > 1.0 -> ascender
//----------------------------------------------
//llSetHoverHeight(float altura, integer agua, float tiempo)
//llStopHover()
//float llGround(vector offset)
//----------------------------------------------
//llLookAt(vector punto, float fuerza, float tiempo)

integer id;

default {
    state_entry() {
        llSensorRepeat("", llGetOwner(), AGENT, 96.0, PI, 0.2);
        //llSetStatus(STATUS_PHYSICS, TRUE);
        //id = llTarget(llGetPos() + <5.0, 0.0, 0.0>, 0.5);
    }
    
    sensor(integer num) {
        llLookAt(llDetectedPos(0), 1.0, 0.5);
    }
    
    at_target(integer num, vector posicion, vector objeto) {
        if(num == id) {
            llOwnerSay("Llegaste!");
            llTargetRemove(id);
        }
    }
    
    not_at_target() {
        llOwnerSay("Todavía no llegas.");
    }
    
    touch_start(integer total_number) {
        //llSay(0, (string)llGetMass());
        //llApplyImpulse(<0.0, 0.0 ,4.0>, FALSE);
        //llSetForce(<0.0, 0.0 ,12.0>, FALSE);
        //llApplyRotationalImpulse(<0.0, 0.0, 4.0>, FALSE);
        //llSetTorque(<0.0, 0.0, 2.5>, FALSE);
        //llMoveToTarget(llGetPos()+<5.0, 0.0, 0.0>, 1.0);
        //llSleep(2.5);
        //llStopMoveToTarget();
        //llSetBuoyancy(1.0);
        //vector pos = llGetPos();
        //llSetHoverHeight(pos.z - llGround(ZERO_VECTOR) + 3.0, TRUE, 0.5);
        //llSleep(3.0);
        //llStopHover();
        llLookAt(llDetectedPos(0), 1.0, 0.5);
    }
}

//////////////////////////////////////////
/*default {
    collision_start(integer num) {
        llSay(0, llDetectedName(0) + " pesa: " + (string)llGetObjectMass(llDetectedKey(0)));
    }
}*/