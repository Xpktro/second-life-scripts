//llSetPrimitiveParams(list parametros)
//llSetLinkPrimitiveParamsFast(integer link, list parametros)
//PRIM_GLOW, integer cara, float intensidad
//PRIM_POINT_LIGHT, integer encendido, vector color, float intensidad, float radio, float atenuacion

default {
    state_entry() {
        llSetLinkPrimitiveParamsFast(LINK_THIS, [PRIM_GLOW, 0, 0.0, PRIM_GLOW, 2, 0.0, PRIM_POINT_LIGHT, FALSE, ZERO_VECTOR, 0.0, 0.0, 0.0]);
    }

    touch_start(integer total_number) {
        llSay(0, (string)llDetectedTouchFace(0));
        state encendido;
    }
}

state encendido {
    state_entry() {
        llSetLinkPrimitiveParamsFast(LINK_THIS, [PRIM_GLOW, 0, 0.2, PRIM_GLOW, 2, 0.2, PRIM_POINT_LIGHT, TRUE, <1.0, 1.0, 1.0>, 1.0, 3.0, 0.0]);
    }
    touch_start(integer total_number) {
        state default;
    }
}
