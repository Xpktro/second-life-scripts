// Tiaeld Tolsen @ Academia de Scripting - Estadísticas de SL en Tiempo Real


//Empezamos definiendo algún par de cosas que utilizaremos luego...
key kRequest;
list lResultados;

//Empezamos el script
default {
	
	//En este ejemplo, obtendremos las estadísticas del estado, número de cuentas y
	//el número de personas conectadas actualmente a SecondLife, utilizando algo llamado
	//Data Feed, que no es más que un pequeño archivo que se actualiza en tiempo real
	//con la información que necesitamos y que se encuentra en http://secondlife.com/xmlhttp/secondlife.php
    state_entry() {
		//No queremos saturar a los servidore oficiales, ni estamos tan desesperados
		//por tener la información al momento, por lo que cada consulta adicional será
		//hecha en un intervalo de 300 segundos (5 minutos).
        llSetTimerEvent(300.);
		
		//Utilizamos un HTTPRequest para obtener el contenido del feed:
        kRequest = llHTTPRequest("http://secondlife.com/xmlhttp/secondlife.php", [], "");
		//Nótese:
        //  -Un HTTPRequest 'saldrá de SL' a hacer una 'consulta', no necesariamente la respuesta
        //  se de instantáneamente, por lo que utilizamos un identificador para trabajar con él.
        //  -Pueden hacerse varios HTTPRequests y las respuestas no llegarán necesariametne en ese mismo
        //  orden, para eso se usa el key.
    }
    
    //Al momento de producirse la respuesta a nuestro Request, se dispara http_response
    http_response(key identificador, integer codigo, list metadatos, string contenido) {
	
		//Averiguamos si la respuesta que obtuvimos corresponde al request que lanzamos,
        if(identificador==kRequest) {
		
			//Asignamos a nuestra lista los resultados de nuestra respuesta,
            //separándolas con el los delimitadores que nos interesan (ver más abajo).
            lResultados = llParseString2List(contenido, ["<status>", "</status>", "<signups>", "</signups>", "<inworld>", "</inworld>"], []);
			
			//Inmediatamente después, mostramos las estadísticas que recogimos como un texto flotante:
            llSetText("Estadísticas de SecondLife:\nEstado: " + llList2String(lResultados, 1) 
					+ "\nCuentas Totales: " + llList2String(lResultados, 3) 
					+ "\nConectados Actualmente: " + llList2String(lResultados, 5), 
			<1., 1., 1.>, 1.);
			//Nótese:
			//  -Los saltos de línea están representados por \n
			//  -La respuesta tiene la siguiente forma:
			//		<stats>
			//			<status>ONLINE</status>
			//			<signups>29,126,152</signups>
			//			<logged_in_last_60>Loading...</logged_in_last_60>
			//			<transactions>Loading...</transactions>
			//			<inworld>58,462</inworld>
			//		</stats>
			//	Al cortarla utilizando las etiquetas de apertura y cierre (<status>, </status>, ....)
			//	obtenemos una lista que se ve más o menos así:
			//		["(etiquetas del inicio)", "ONLINE", "(cierre y apertura)", "29,126,152", "(cierre y apertura)", ...]
			//	es por eso que los datos son mostrados sacándolos de la lista con índices impares.
        }
    }

	//Cuando pasen los 300 segundos, se disparará el evento timer
    timer() {
	
		//Donde simplemente solicitaremos la información una vez más, disparando otra vez
		//al evento http_response
        kRequest = llHTTPRequest("http://secondlife.com/xmlhttp/secondlife.php", [], "");
    }
    
	//Cada vez que el objeto sea rezeado en el mundo, se dispara on_rez
    on_rez(integer i) {
		
		//Para reiniciar el script y repetir todo el proceso desde el inicio.
        llResetScript();
    }
}
