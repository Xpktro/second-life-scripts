//llParcelMediaCommandList(list comandos) 

//llParcelMediaCommandList([PARCEL_MEDIA_COMMAND_TEXTURE, "UUID", ...])
// PARCEL_MEDIA_COMMAND_LOOP
// PARCEL_MEDIA_COMMAND_TEXTURE, ""
// PARCEL_MEDIA_COMMAND_TYPE, ""
//                            "audio/*"
//                            "video/*"
//                            "image/*"
//                            "text/html"

//tipos MIME

default {
    
    state_entry() {
        llSetTexture("c28cc704-9f78-d924-967c-c0783233668d", 0);
    }

    touch_start(integer total_number) {
        
        llParcelMediaCommandList([PARCEL_MEDIA_COMMAND_URL, "http://secondlife.com", 
                                PARCEL_MEDIA_COMMAND_TYPE, "video/*",                              
                                PARCEL_MEDIA_COMMAND_TEXTURE, "c28cc704-9f78-d924-967c-c0783233668d", 
                                PARCEL_MEDIA_COMMAND_PLAY, 
                                PARCEL_MEDIA_COMMAND_LOOP]);
        
        //PARCEL_MEDIA_COMMAND_STOP
        //PARCEL_MEDIA_COMMAND_PAUSE   
        //PARCEL_MEDIA_COMMAND_UNLOAD     
    }
}

//-------------------------------------------------------

//integer llSetPrimMediaParams(integer cara, list comandos)
//PRIM_MEDIA_HOME_URL, "url"
//PRIM_MEDIA_AUTO_PLAY, TRUE/FALSE
//PRIM_MEDIA_CONTROLS, PRIM_MEDIA_CONTROLS_STANDARD/PRIM_MEDIA_CONTROLS_MINI
//PRIM_MEDIA_CURRENT_URL, "url"
//PRIM_MEDIA_FIRST_CLICK_INTERACT, TRUE/FALSE
//PRIM_MEDIA_WHITELIST, "url,url,url,....."
//PRIM_MEDIA_WHITELIST_ENABLE, TRUE/FALSE
//PRIM_MEDIA_PERMS_INTERACT, PRIM_MEDIA_PERM_NONE / PRIM_MEDIA_PERM_OWNER / PRIM_MEDIA_PERM_GROUP / PRIM_MEDIA_PERM_ANYONE

/*default {
    touch_start(integer total_number) {
        llSetPrimMediaParams(0, [PRIM_MEDIA_HOME_URL, "http://collabedit.com/x84ur", PRIM_MEDIA_AUTO_PLAY, TRUE]);
    }
}*/

