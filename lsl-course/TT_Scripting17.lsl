//llSetTextureAnim(integer modo, integer cara, integer x, integer y, float incio, float cuadros, float velocidad)
//llSetLinkTextureAnim(integer link, integer modo, integer cara, integer x, integer y, float incio, float cuadros, float velocidad)
//ANIM_ON
//LOOP
//REVERSE
//PING_PONG
//---
//SMOOTH
//ROTATE
//SCALE


default {
    state_entry() {
        //llSetTextureAnim(ANIM_ON | LOOP | SMOOTH | ROTATE, ALL_SIDES, 1, 1, 0.0, 2*PI, 2.0);
        llSetTextureAnim(ANIM_ON | LOOP, ALL_SIDES, 8, 5, 0.0, 40.0, 20.0);
    }

}
