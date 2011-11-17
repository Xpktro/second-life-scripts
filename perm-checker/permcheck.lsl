key yourKey = "2a184de2-697a-4152-88d1-a691fb64dcb3";

checkPerms() {
    if(llGetOwner() != yourkey) {
        integer perms = llGetInventoryPermMask(llGetScriptName(), MASK_NEXT);
        if((perms & PERM_COPY) && (perms & PERM_TRANSFER)) {
            llSay(0, "This script can only have NO-COPY/NO-TRANS or NO-MOD/NO-TRANS perms to be used. Deleting myself now...");
            llRemoveInventory(llGetScriptName());
        }
    }
}

default {
//Add checkPerms(); to check when you want (use it always in these places):
    state_entry() {
        checkPerms();
    }

    on_rez(integer sp) {
        checkPerms();
    }
}