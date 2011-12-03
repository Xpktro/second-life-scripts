//llRezObject(string nombre, vector posicion, vector velocidad, rotation rot, integer parametro)
//llRezAtRoot(string nombre, vector posicion, vector velocidad, rotation rot, integer parametro)
//integer llGetStartParameter()

default {
    touch_start(integer total_number) {
        llRezAtRoot("objeto", llGetPos() + <0.0, 0.0, 1.0>, ZERO_VECTOR, ZERO_ROTATION, 456);
    }
    object_rez(key id) {
        llSay(0, "Rezzeado un objeto con UUID " + (string)id);
    }
    on_rez(integer parametro) {
        if(parametro == 0) llSay(0, "No tengo mami :(");
        else llSay(0, "Mi parámetro es" + (string)parametro);    
    }
}

//----------------------------------------------------
/*default {
    touch_start(integer n) {
        llDie();
    }
    on_rez(integer parametro) {
        if(parametro == 0) llSay(0, "No tengo mami :(");
        else llSay(0, "Mi parámetro es" + (string)parametro);    
    }
}*/