//string textura = "6fcb7ca0-06e2-06d5-c775-36ee4e998de7";

//string llGetAgentLanguage(key id): Devuelve el idioma del visor del avatar con key 'id'.
// en-us: Inglés
// zh: Chino
// es: Español
// de: Alemán
// fr: Francés
// ja: Japonés
// ko: Koreano
// pt: Portugués

//integer llDetectedTouchFace(integer d): Devuelve un número que representa
//la cara del prim que está siendo tocada.

//string llGetDate(): Devuelve la fecha.

//llSetTexture(string nombre, integer cara): Pinta el prim con la textura de nombre 
//como el primer parámetro, y en la cara dada en el segundo parámetro.

//string llGetInventoryName(integer constante, integer numero): Devuelve el nombre de un objeto dentro del inventario del prim.
//INVENTORY_ALL - Todo tipo de objetos
//INVENTORY_TEXTURE - Texturas
//INVENTORY_SOUND - Sonidos
//INVENTORY_LANDMARK - Landmarks
//INVENTORY_CLOTHING - Prendas
//INVENTORY_OBJECT - Objetos
//INVENTORY_NOTECARD - Notecards
//INVENTORY_SCRIPT - Scripts
//INVENTORY_BODYPART - Partes del cuerpo
//INVENTORY_ANIMATION - Animaciones
//INVENTORY_GESTURE - Gestures

default
{
    state_entry()
    {
       //llSetTexture(textura, ALL_SIDES);
       llSetTexture(llGetInventoryName(INVENTORY_TEXTURE, 0), ALL_SIDES);
       llOwnerSay(llGetDate());
    }

    touch_start(integer total_number)
    {
        llOwnerSay(llGetAgentLanguage(llDetectedKey(0)));
        llOwnerSay((string)llDetectedTouchFace(0));
    }
}
