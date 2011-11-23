integer a = 0; 
float b = 1.0;
        //Red, Green, Blue (RGB) 
vector c = <0.0, 0.5, 1.0>; 
string mensaje = "Hola, este es un texto.";
rotation r;
key id = "a90cf39a-d8f7-4dc0-adcf-cbde11a6fb07"; 

default
{
    state_entry()
    {
        
        llSay(a, mensaje + " " + (string)id);
        llSetText(mensaje, c, b);
        
    }

    touch_start(integer total_number)
    {
        llSetColor(c, ALL_SIDES);
        llSleep(b);
        llSay(0, mensaje);  
        //llResetScript();      
    }
}