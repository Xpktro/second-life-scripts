//llMessageLinked(integer link, integer num, string mensaje, key id)
//LINK_THIS: Al mismo prim
//LINK_ROOT: Al prim raiz
//LINK_ALL_OTHERS: A todos los demás prims
//LINK_ALL_CHILDREN: A todos los prims menos al raiz
//LINK_SET: A todo el conjunto de prims

// link_message(integer link, integer num, string mensaje, key id){
//}

default {
    touch_start(integer total_number) {
        llMessageLinked(LINK_ALL_OTHERS, 0, "Hola", NULL_KEY);
    }
    link_message(integer link, integer num, string mensaje, key id){
        llSay(0, mensaje);
    }
}

//----------------------------------

/*default {
    link_message(integer link, integer num, string mensaje, key id){
        llSay(0, mensaje);
    }
}*/