list lista = [1, "dos", 3.14, 4, <5.0, 0.0, 0.0>];
list listados = [4, 5, 2, 3, 1];
list resultados;

//string llList2CSV(list lista): Devuelve un string con los contenidos de la lista separados por comas.

//string llDumpList2String(list lista, string separador): Devuelve un string con los contenidos de la lista separados con uno o más caracteres arbitrarios.
//list llListSort(list lista, integer agrupamiento, integer ascend): Ordena una lista ascendente o descendentemente.

//XXX llList2XXXXX(list lista, integer posicion), XXX=tipo de dato a convertir

// if(condicion){intrucciones} : Estructura de control, realiza una serie de instrucciones si la condición se cumple.
//Operadores Lógicos:
// !(~) : No (negación): Niega el valor lógico que se encuentre entre los paréntesis
// == : Exactamente igual
// != : Diferente
// < : Menor que
// > : Mayor que
// <= : Menor igual que
// >= : Mayor igual que

default
{
    touch_start(integer total_number)
    {
        integer numero = 2;
        
        if(llDetectedKey(0)==llGetOwner()) {
            llSay(0, "Mi dueño me ha tocado.");        
        }
        
        
        if(numero>1) {
            llOwnerSay("Correcto.");
        }
        
        resultados = llListSort(listados, 1, FALSE);
        llOwnerSay(llList2CSV(lista));
        llOwnerSay(llDumpList2String(lista, "->"));
        llOwnerSay((string)resultados);
        llOwnerSay(llList2String(lista, 1));
        
    }
}