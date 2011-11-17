//money(key avatar, integer cantidad) {}
//llSetPayPrice(integer precio, list botones)
//PAY_HIDE

//--------------

//llRequestPermissions(key avatar, integer permisos)
//PERMISSION_DEBIT

//integer llGiveMoney(key avatar, integer dinero)

integer total;

default {
    state_entry() {
        llRequestPermissions(llGetOwner(), PERMISSION_DEBIT);
    }
    
    run_time_permissions(integer permisos) {
        if(permisos & PERMISSION_DEBIT) {
            state funcion;
        }
    }
}

state funcion {
    state_entry() {
        llSetPayPrice(100, [PAY_HIDE, PAY_HIDE, PAY_HIDE, PAY_HIDE]);
    }

    money(key avatar, integer dinero) {
        if(dinero >= 100) {
            total += dinero;
            llSetText(
            "Total acumulado: " + (string)total 
            + "\nÚltimo tip: " + llKey2Name(avatar) 
            + "\nPagando: " + (string)dinero,
             <1,1,1>, 1);
         } else {
             llGiveMoney(avatar, dinero);
             llSay(0, "Este objeto recibe cantidades mayores a 100, usted ha pagado " + (string)dinero);
         }
    }
}
