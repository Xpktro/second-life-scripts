//llSensor(string nombre, key id, integer tipo, float rango, float arco) - Lanza un sensor en busca de un nombre, o un key de un objeto de determinado tipo en determinado rango, con un arco definido.
//llSensorRepeat(string nombre, key id, integer tipo, float rango, float arco, float repeticion) - Igual que llSensor pero repitiéndose en cierto intervalo de tiempo.
//llSensorRemove() - Apaga un llSensorRepeat en curso.
//vector llDetectedPos(integer numero) - Devuelve la posición del avatar detectado en coordenadas globales.
//float llVecMag(vector vec) - Devuelve el módulo (tamaño) del vector dado.
//AGENT
//AGENT_BY_LEGACY_NAME
//AGENT_BY_USERNAME
//ACTIVE
//PASSIVE
//SCRIPTED
//Rango máximo del sensor: 96.0
//PI
//PI_BY_TWO

//BONUS!: llInstantMessage(key avatar, string mensaje) - Envía un mensaje a un avatar, encuentre donde se encuentre, independientemente de su estado.

integer contador;

default {
    state_entry() {
        llSensorRepeat("", NULL_KEY, AGENT, 96.0, 2*PI, 0.5);
    }
    
    sensor(integer numero) {
        list nombres;
        string paramostrar;
        for(contador = 0; contador<numero; contador++) {
            paramostrar = llDetectedName(contador)+ "( " +(string)llVecMag(llDetectedPos(contador) - llGetPos())+" )";
            nombres += paramostrar;
        }
        //llSay(0, "Se ha(n) sentido " + (string)numero + " avatares.");
        
        llSetText(llDumpList2String(nombres,"\n"), <1,1,1>, 1.0);
    }
    
    no_sensor() {
        llSay(0, "No se encontró nada");
    }
    
}
