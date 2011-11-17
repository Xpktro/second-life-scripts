//Operador lógico OR ||

integer a = TRUE;
integer b = TRUE;

// do {
//     instrucciones...
// } while(condición);
// Ejecuta el bloque de instrucciones hasta que la condición no se cumpla.

// while(condición) {
//     instrucciones...
// }
// Comprueba la condición para ejecutar las instrucciones repetitivamente hasta que no se cumpla.

// for(condición inicial; condición final; incremento) {
//     instrucciones...
// }
//

default {
    touch_start(integer total_number) {
        if( a!=TRUE || b==TRUE ) {
            llSay(0, "Una de los dos valores es verdadero.");
        }
        
        integer cuenta = 0;
     
        /*while(cuenta<6) {
            llOwnerSay((string)cuenta);
            cuenta++;
        }
        
        do {
            llOwnerSay((string)cuenta);
            cuenta++;
        }while(cuenta<6);*/
        
        for(cuenta=0; cuenta<6; cuenta++) {
            llOwnerSay((string)cuenta);
        }
        
    }
}
