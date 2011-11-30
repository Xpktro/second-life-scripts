//llSetLinkPrimitiveParamsFast(integer link, list reglas)
//PRIM_TYPE, PRIM_TYPE_SCULPT, string mapa, integer tipo
//----------------------------
//PRIM_SCULPT_TYPE_SPHERE
//PRIM_SCULPT_TYPE_TORUS
//PRIM_SCULPT_TYPE_PLANE
//PRIM_SCULPT_TYPE_CYLINDER
//----------------------------
//PRIM_SCULPT_FLAG_INVERT
//PRIM_SCULPT_FLAG_MIRROR
//----------------------------

list sculpts = ["146cf5c7-f4cc-1b08-6f15-6e91cc869c07", "fd27c3dc-d916-9e2f-e2a5-243d911face8", "786bd55c-77e7-44c5-b7b2-5bd6ef490b93", "c9e701e7-3581-9100-2661-62d5d742d6b5", "42cfb1d5-3bfa-5b61-7006-a568925a84f6"];

integer contador = 0;

default {
    state_entry() {
        llSetTimerEvent(1.0);
    }
    timer() {
        llSetLinkPrimitiveParamsFast(LINK_THIS, [PRIM_TYPE, PRIM_TYPE_SCULPT, llList2String(sculpts, contador), PRIM_SCULPT_TYPE_SPHERE]);
        llSetText((string)contador, <1.0,1.0,1.0>, 1.0);
        contador++;
        if(contador == llGetListLength(sculpts)) {
            contador = 0;
        }
    }
}
