//llStartAnimation(string nombre) - Ejecuta una animación con el nombre dado, una vez cedidos los permisos para ejecutar animaciones sobre el avatar.

//llStopAnimation(string nombre) - Detiene una animación con el nombre dado.

//Tarea: 
//Realizar una poseball bajo las siguientes especificaciones:
//    -Ajustar el texto flotante de la poseball (cambiar el texto flotante).
//    -Ajustar la posición del avatar respecto a la poseball.
//    -Color de la poseball.
//    -Se vuelve invisible la poseball y el texto al sentarse un avatar encima.
//    -Ejecutar una animación cualquiera (no importa el nombre) al sentarse.
//    -Detener la animación y regresar la visibilidad de la poseball al levantarse.

default {
    state_entry() {
        llRequestPermissions(llGetOwner(), PERMISSION_TRIGGER_ANIMATION);
    }
    
    run_time_permissions(integer permisos) {
        if(permisos & PERMISSION_TRIGGER_ANIMATION) {
            llStartAnimation(llGetInventoryName(INVENTORY_ANIMATION, 0));
            llSleep(5);
            llStopAnimation(llGetInventoryName(INVENTORY_ANIMATION, 0));
        }
    }
    
    changed(integer cambio) {
        if(cambio & CHANGED_INVENTORY) {
            llResetScript();
        }
    }
}
