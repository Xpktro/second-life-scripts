//string llMD5String(string fuente, integer sal)
//string llSHA1String(string fuente)
//------------------------------------------------
//string llStringToBase64(string fuente)
//string llBase64ToString(string fuente)
//------------------------------------------------
//string llXorBase64StringsCorrect(string unoBase64, string dosBase64)

string texto = "Tocado";

default {
    state_entry() {
        llSay(0, llMD5String("Hola avatar!", 2));
    }

    touch_start(integer total_number) {
        //llSay(0, llSHA1String("Tocado"));
        
        /*texto = llStringToBase64(texto);
        llSay(0, texto);
        
        texto = llBase64ToString(texto);
        llSay(0, texto);*/
        
        texto = llXorBase64StringsCorrect(llStringToBase64(texto), llStringToBase64("contraseña"));
        llSay(0, texto);
        
        texto = llBase64ToString(llXorBase64StringsCorrect(texto, llStringToBase64("contraseña")));
        llSay(0, texto);
    }
}
