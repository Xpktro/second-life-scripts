//--------------------------User Defined Variables and Strings--------------------------------
integer price = 1;

string defaultmessage1 = "Look what the future haves to tell you! Pay ";
string defaultmessage2 = "l$ to get your daily horoscope.";
string youpaid = "You paid";
string needtopay = "l$, you must pay: ";
string tousethis = "l$ to use this machine.";
string selectyoursign = "Select your Sign:";
string datesign = "Date: ";
string dayofweek = "Day of Week: ";
string luckystone = "Lucky Stone: ";
string colorssign = "Colors: ";
string flowerssign = "Flowers: ";
string metalssign = "Metals: ";
string animalssign = "Animals: ";
string todaymessage = "Horoscope of today ";

integer dateformat = 1; // 1: mm/dd/yyyy - 2: dd/mm/yyyy

//-----------------------------
//Do NOT change the order of this list items
//If you change a value of this list, you must rename your notecard to the value you changed (eg. Piscis -> Pisces and rename the Piscis notecard to Pisces)
//Additionally, these names will be used in the sign selection dialog AND for reading the predictions you set in your notecard
list signs = ["Capricorn", "Aquarius", "Pisces", "Libra", "Scorpio", "Sagittarius", "Cancer", "Leo", "Virgo", "Aries", "Taurus", "Gemini"];
//-----------------------------

//Do NOT change the order of this list items, change them in the order they're presented
list dates = ["December 22 - January 20", "January 21 - February 19", "February 20 - March 20", "September 23 - October 22", "October 23 - November 22", "November 23 - December 21", "June 22 - July 22", "July 23 - August 23", "August 24 - September 22", "March 21 - April 20", "April 21 - May 20", "May 21 - June 21"];
list days = ["Saturday", "Saturday", "Thursday", "Friday", "Tuesday", "Thursday", "Monday", "Sunday", "Wednesday", "Tuesday", "Friday", "Wednesday"];
list stones = ["Amber", "Amber", "Red Coral", "Coral", "Coral", "Brilliant", "Pearl", "Ruby, Diamond", "Sapphire", "Diamond", "Emerald", "Loadstone"];
list colors = ["Yellow, Brown, Blue, Black", "Green, Black, Blue", "Purple, Gray, Blue", "Pink, Sky-blue, Brown", "Black, Ochre, Violet", "Blue, Purple, Yellow", "Gray, Silver, White", "Red, Yellow, Orange", "White, Yellow, Sage Green, Violet", "Red, Orange", "Pink, Brilliant Green", "Blue, Gray"];
list flowers= ["Gardenia, Daisy, Violet, Narcissus", "Azalea, Hydrangea, Poppy", "Iris, Camellia, Lilac", "Narcissus, Rose, White Lily, Gardenia", "Orchid, Gardenia, Dahlia", "Carnation, Daisy, Iris", "Jasmine, Lily, Gardenia", "Sunflower, Mimosa", "Sunflower, Mimosa", "Carnation, Poppy, Tulip, Yellow Elder", "White Lily, Hyacinth, Rose, Peach Flower", "Daisy, Foget-me-not"];
list metals = ["Lead", "Lead", "Tin", "Copper", "Iron, Platinum", "Tin", "Silver", "Gold", "Mercury", "Iron", "Copper", "Mercury"];
list animals = ["Crocodile, Sheep, Robin", "Owl, Crow, Eel", "Elephant, Dolphin, Dog", "Turtledove, Finch", "Mole, Snake, Dormouse", "Horse, Deer, Turkey, Swan", "Hare, Cat, Swan", "Dog, Panther, Canary", "Dog, Swallow", "Wolf, Rooster", "Bull, Seal", "Parrot, Monkey, Squirrel"];


//---------------------You don't need to touch ANYTHING below this line, for real-----------------------
key qKey;
key customer = NULL_KEY;
integer seed = 6666;
integer listen_handle;
integer listennumber;
integer line;
integer lines;
integer index;
string note_name;
string todaydate;
string prediction;
list predictioncomplete;

default {    
    state_entry() {        
        llSetPayPrice(PAY_HIDE, [PAY_HIDE ,PAY_HIDE, PAY_HIDE, PAY_HIDE]);
        llRequestPermissions(llGetOwner(), PERMISSION_DEBIT);        
    }

    changed(integer change) {        
        if(change & CHANGED_OWNER) {
            llResetScript();                
        }        
    }
    
    run_time_permissions(integer perm) {        
        if(perm & PERMISSION_DEBIT)
            state normal;    
    }    
}

state normal {    
    state_entry() {        
        llSetPayPrice(PAY_HIDE, [price ,PAY_HIDE, PAY_HIDE, PAY_HIDE]);
        listennumber = (integer)llFrand(seed);  
    }
    
    touch_start(integer num) {    
            llSay(0, defaultmessage1 + (string)price + defaultmessage2);
    }
    
    money(key id, integer moneypaid) {        
        if(moneypaid != price) {            
            llGiveMoney(id, moneypaid);
            llInstantMessage(id, youpaid + (string)moneypaid + needtopay + (string)price + tousethis);            
        }        
        else {            
            listen_handle = llListen(listennumber, "", NULL_KEY, "");
            customer = id;
            llDialog(customer, selectyoursign, signs, listennumber);            
        }    
    }
    
    listen(integer canal, string name, key id, string msg) {       
        if(canal == listennumber && customer!=NULL_KEY) {            
           note_name = msg;
           lines=0;           
           if(dateformat==1) {           
                todaydate = llGetSubString(llGetTimestamp(),5,6) + "/" + llGetSubString(llGetTimestamp(),8,9) + "/" + llGetSubString(llGetTimestamp(),0,3);                
           } else {           
                todaydate = llGetSubString(llGetTimestamp(),8,9) + "/" + llGetSubString(llGetTimestamp(),5,6) + "/" + llGetSubString(llGetTimestamp(),0,3);           
           }
           predictioncomplete = [];
           index = llListFindList(signs, [note_name]);           
           predictioncomplete = (predictioncomplete=[]) + predictioncomplete + (note_name + ":") + ( datesign + llList2String(dates, index) ) + ( dayofweek + llList2String(days, index) ) + ( luckystone + llList2String(stones, index) ) + ( colorssign + llList2String(colors, index) ) + ( flowerssign + llList2String(flowers, index) ) + ( metalssign + llList2String(metals, index) ) + ( animalssign + llList2String(animals, index) ) + ("\n" + todaymessage + todaydate + ":");
           qKey = llGetNumberOfNotecardLines(note_name);      
           llListenRemove(listen_handle);           
        }
    }
    
    dataserver(key query, string data) {        
        if(query==qKey) {   
            if(lines == 0) {            
                lines = (integer)data;
                line = (integer)llFrand((float)data);
                qKey = llGetNotecardLine(note_name, line);   
            
            } else {                
                predictioncomplete = (predictioncomplete=[]) + predictioncomplete + data;
                llInstantMessage(customer, llDumpList2String(predictioncomplete, "\n"));    
                customer = NULL_KEY;                
            }
        }        
    }
    
    changed(integer change) {        
        if(change & CHANGED_OWNER) {
            llResetScript();                
        }        
    }    
}
