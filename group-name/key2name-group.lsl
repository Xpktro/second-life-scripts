// Tiaeld Tolsen @ Academia de Scripting - Nombre de un grupo, dado su UUID

//Empezamos definiendo algún par de cosas que utilizaremos luego...
string nombre;
key grupo;
key keyRequest;
integer manejadorListener;

//Empezamos el script

default {
    
    //En este ejemplo, haremos que nuestro querido usuario provea a nuestro script
    //del UUID del grupo cuyo nombre averiguaremos, para ello:    
    touch_start(integer n) {
        //Por si quedó algún residuo de un listener anterior...
        llListenRemove(manejadorListener);
        
        //Abrimos un listener para nosotros, que usaremos para recoger el nombre.
        manejadorListener = llListen(0, "", llGetOwner(), "");
        
        llSay(0, "Diga el UUID del grupo a consultar.");
    }
    
    //Cuando digamos algo por el chat, una vez abierto el listener...
    listen(integer canal, string nombre, key id, string mensaje) {
        
        //No necesitaremos nuestro listener por ahora, así que lo matamos.
        llListenRemove(manejadorListener);
		
		//Rescatamos el mensaje (que contiene el UUID) en una variable (por ahora).
		grupo = (key)mensaje;

        //Rescatamos el UUID del grupo. LSL _NO_ provee de un método
        //para recuperar el nombre de un grupo dado su key, por lo que
        //nos valdremos de un pequeño 'truco': Cuando accedemos a
		//http://world.secondlife.com/group/UUID-del-grupo obtenemos una
		//página con información relevante a este grupo, específicamente esta
		//página tiene el nombre del grupo dado en su título, por lo que la
		//usaremos para nuestros fines.
		//
		//Empezamos asignando a nuestra variable el valor de la consulta HTTP para
		//reconocerla en el futuro:
        keyRequest = llHTTPRequest("http://world.secondlife.com/group/" + mensaje, [], "");
        //Nótese:
        //  -Un HTTPRequest 'saldrá de SL' a hacer una 'consulta', no necesariamente la respuesta
        //  se de instantáneamente, por lo que utilizamos un identificador para trabajar con él.
        //  -Pueden hacerse varios HTTPRequests y las respuestas no llegarán necesariametne en ese mismo
        //  orden, para eso se usa el key.
        
    }
    
    //Al momento de producirse la respuesta a nuestro Request, se dispara http_response
    http_response(key identificador, integer codigo, list metadatos, string contenido) {

        //Averiguamos si la respuesta que obtuvimos corresponde al request que lanzamos,
        //y si la respuesta tiene código 200 (OK). Otros códigos de respuesta pueden ser:
        //  -> 404 - Recurso no encontrado
        //  -> 500 - Error del servidor
        if(identificador == keyRequest && codigo == 200) {
        
            //Nuestra respuesta contendrá el código HTML de una página de Second Life
			//conteniendo información del grupo que, entre otras cosas, tiene exactamente
			//lo que nos interesa: su nombre. Especialmente para el caso del nombre, este
			//se encuentra ubicado en el título de la página, y recordando algo de HTML
			//básico, el título de una página se encuentra rodeado de las etiquetas <title>
			//y </title>, por lo que utilizaremos estos dos 'símbolos' para realizar un corte
			//en la respuesta y extraer exactamente lo que necesitamos.			
			list resultados = llParseString2List(contenido, ["<title>", "</title>"], []);			
            //Nótese:
            //  -En síntesis, la respuesta sería algo como: 
            //     (código html) <title> Nombre del Grupo </title> (más código HTML)
            //  entonces, si separamos la respuesta con llParseString2List usando
            //  tanto a '<title>' como a '</title>' de separadores, obtendremos una 
			//	lista en donde, el elemento 0 (el primero) será el código HTML precedente
			//	al nombre, el elemento 1 será el nombre (que es lo que nos interesa), y
			//	el elemento 2 será el resto de la página web.
			
			nombre = llList2String(resultados, 1);            
			llSay(0, "El nombre del grupo " + (string)grupo + " es: " + nombre);
            
        //En caso de que el código de la respuesta no sea satisfactorio:
        } else {
            llSay(0, "Servicio no disponible actualmente. Intente luego.");
        }
    }    
}