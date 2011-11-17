//llSetPrimitiveParams(list parametros)
//llSetLinkPrimitiveParamsFast(integer link, list parametros)
//llDetectedLinkNumber

//rotation llEuler2Rot(vector rotacion_euler)
//rotation llGetRot<----

rotation rotacion;

default {
    state_entry() {
        
        rotacion = llEuler2Rot(<0, 60, 0> * DEG_TO_RAD);
    
    
        llSetPrimitiveParams([
        
        PRIM_TYPE, PRIM_TYPE_TORUS, PRIM_HOLE_DEFAULT, <0.0, 1.0,0.0>, 0.0, ZERO_VECTOR, <1.0, 0.25, 0.0>, ZERO_VECTOR, <0.0, 1.0, 0.0>, ZERO_VECTOR, 1.0, 0.0, 0.0, 
                
        PRIM_PHYSICS, FALSE,
        
        PRIM_ROT_LOCAL, rotacion
        
        ]);
    }
}
