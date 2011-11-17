//llRequestPermissions(key avatar, integer permisos)
//PERMISSION_TAKE_CONTROLS
//--------------------------------------------------
//llTakeControls(integer controles, integer aceptar, integer pasar)
//CONTROL_FWD = Flecha de 'Adelante' (W o ?)
//CONTROL_BACK = Flecha de 'Atrás' (S o ?)
//CONTROL_LEFT = Desplazamiento a la Izquierda (Shift + ?)
//CONTROL_RIGHT = Desplazamiento a la Derecha (Shift + ?)
//CONTROL_UP = Saltar o subir (E ó PgUp)
//CONTROL_DOWN = Agacharse o bajar (C ó PgDn)
//CONTROL_ROT_LEFT = Rotación a la izquierda (A o ?)
//CONTROL_ROT_RIGHT = Rotación a la derecha (D o ?)
//CONTROL_LBUTTON = Botón izquierdo del mouse (sobre el suelo).
//CONTROL_ML_LBUTTON = Botón izquierdo del mouse (vista subjetiva).

//aceptar | pasar
// FALSE    FALSE = Los demás controles no funcionan, no se generan eventos.
// FALSE    TRUE  = Todos los controles funcionan, no se generan eventos.
// TRUE     FALSE = Los demás controles funcionan, los controles no funcionan pero generan eventos.
// TRUE     TRUE  = Todos los controles funcionan, se generan eventos.

//llReleaseControls()
//--------------------------------------------------------
//vector llRot2Fwd(rotation rot)

default {
    state_entry() {
        llRequestPermissions(llGetOwner(), PERMISSION_TAKE_CONTROLS);
    }

    run_time_permissions(integer permisos) {
        if(permisos & PERMISSION_TAKE_CONTROLS) {
            state funcion;
        }
    }
}

state funcion {
    state_entry() {
        llTakeControls(CONTROL_FWD | CONTROL_BACK | CONTROL_ROT_LEFT | CONTROL_ROT_RIGHT, TRUE, FALSE);
    }
    
    control(key id, integer presion, integer cambio) {
        // & | ~
        if(presion & cambio & CONTROL_FWD) llSetPos(llGetPos() + llRot2Fwd(llGetRot()));
        if(presion & cambio & CONTROL_BACK) llSetPos(llGetPos() - llRot2Fwd(llGetRot()));
        if(presion & cambio & CONTROL_ROT_LEFT) llSetRot(llGetRot() * llEuler2Rot(<0.0, 0.0, 20.0> * DEG_TO_RAD));
        if(presion & cambio & CONTROL_ROT_RIGHT) llSetRot(llGetRot() * llEuler2Rot(<0.0, 0.0, -20.0> * DEG_TO_RAD));
        //if(presion & ~cambio & CONTROL_FWD) llOwnerSay("presion");
        //if(~presion & cambio & CONTROL_FWD) llOwnerSay("fin");
    }
    
    touch_start(integer n) {
        llReleaseControls();
    }

}
