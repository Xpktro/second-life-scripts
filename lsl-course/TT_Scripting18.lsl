//llOwnerSay("@nombre:datos(=y/n)")

// @comando

// @versionnum=2
// @clear=permiso
// @fly=y/n
// @alwaysrun=y/n
// @temprun=y/n
// @sendchat=y/n
//---
// @chatshout=y/n
// @chatwhisper=y/n
// @chatnormal=y/n
// @redirchat:canal=rem/add
//----
// @sendim_sec=y/n
// @sendimto:UUID=y/n
// @startim=y/n
// @startim:UUID=rem/add
// @recvchat=y/n
// @recvchat:UUID=rem/add
// @recvchatfrom:UUID=y/n
//-----
// @tpto:X/Y/Z=force
// @accepttp:UUID=rem/add
//---
// @showinv=y/n
// @viewnote=y/n
// @viewscript=y/n
// @viewtexture=y/n
// @edit=y/n
// @rez=y/n
//----
// @unsit=y/n
// @sit:UUID=force
// @sit=y/n
//-----
// @detach=y/n
// @defaultwear=y/n
// @detach[:attachpt]=force
// @addoutfit[:<part>]=y/n
//-----
// @getinv:folder1/folder2......=2

// @attach:folder1/folder2......=force
// @attachover:folder1/folder2........=force
// @attachall:folder1/.../folder=force
// @attachallover:folder1/....=force
// @detach:folder1/....=force
// @detachall:folder1/.....=force

default {
    state_entry() {
        llOwnerSay("@getinv=2");
        //llOwnerSay("@sit:"+(string)llGetKey()+"=force");
        
        llListen(2, "", llGetOwner(), "");
    }

    listen(integer chan, string nombre, key id, string msg) {
        llSay(0, msg);
    }
    
}
 