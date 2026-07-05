enum ITEM_INDEX
{
    NONE,
    LOSER_CANDY,
    POPSICLE,
    MILK_HALF,
    MILK_FULL,
    PANCAKE,
    CHIPACKERZ,
    HAMSTICK,
    PIZZA_REFRESHING,
    PIZZA_INFINITE,
    SMILE_DIP,
    COOKIE_JAR_EMPTY,
    COOKIE_JAR_1,
    COOKIE_JAR_2,
    COOKIE_JAR_FULL,
    SPAGHETTI,
    ONION_1,
    ONION_2,
    ONION_3,
    ONION_4,
    ONION_5,
    ONION_6,
    ONION_7,
    ONION_8,
    ONION_9,
    ONION_10,
    ONION_11,
    ONION_12,
    ONION_13,
    ONION_14,
    ONION_15,
    ONION_MAX,
    //FAIRY_DUST,
    //PB_SHARD,
    HOLY_WATER,
    //JERKY,
    PITT_COLA,
    //MABEL_JUICE,
    //GIDEON_DOLL,
    //LOTION,
    //WHISTLE,
    MAGIC_ARMOR,
    TOTAL
}

/// @desc Constructs a new item information struct.
/// @param {Enum.ITEM_INDEX} _index The item's index, for redundancy's sake
/// @param {String} _name The item's pretty-print name (should be shortenable to <=13 characters)
/// @param {String} _description A brief (2-line) description of the item
/// @param {String} _use_response A response to using the item (if usable) or attempting to use the item (if unusable)
/// @param {Real} _price The standard cost of this item (sell cost is just halved)
/// @param {Real} _heal How much this item heals the player. Omit for battle-only items
/// @param {Bool} _usable Whether this item can be consumed or used in any way
/// @param {Enum.ITEM_INDEX} _use_result If this item is trashed or used, with what should it be replaced in the player's inventory?
function ItemInfo(_index, _name, _description, _use_response, _price, _heal = 0, _usable = true, _use_result = ITEM_INDEX.NONE) constructor
{
    index = _index;
    name = _name;
    description = _description;
    useResponse = _use_response;
    price = _price;
    heal = _heal;
    usable = _usable;
    useResult = _use_result;
}

/// @desc Creates item info for all known items.
/// @return {Array<Struct.ItemInfo>}
function scr_generate_item_info()
{
    var _item_info = array_create(ITEM_INDEX.TOTAL);
    _item_info[ITEM_INDEX.NONE] = ;
    _item_info[ITEM_INDEX.LOSER_CANDY] = ItemInfo(
        ITEM_INDEX.LOSER_CANDY,
        "Loser Candy",
        "Some old, unwanted Halloween #candy.",
        "You feel sick.",
        15,
        5
    );
    _item_info[ITEM_INDEX.POPSICLE] = ItemInfo(
        ITEM_INDEX.POPSICLE,
        "Popsicle",
        "A Popsicle-on-a-Stick.&Somehow, it's always frozen.",
        "The stick has a skeleton pun.&How dreadful.",
        25,
        10
    );
    _item_info[ITEM_INDEX.MILK_HALF] = ItemInfo(
        ITEM_INDEX.MILK_HALF,
        "[1] LanLan Milk",
        "From the Legend of Zeppeli.&Half the bottle remains.",
        "Discarded the empty bottle.&Don't drive yourself home.",
        15,
        10
    );
    _item_info[ITEM_INDEX.MILK_FULL] = ItemInfo(
        ITEM_INDEX.MILK_FULL,
        "[2] LanLan Milk",
        "From the Legend of Zeppeli.&Contains 2 doses.",
        "Drank half.&Make sure to pace yourself.",
        55,
        10,
        true,
        ITEM_INDEX.MILK_HALF
    );
    _item_info[ITEM_INDEX.PANCAKE] = ItemInfo(
        ITEM_INDEX.PANCAKE,
        "Stancake",
        "Retrieved from Greasy's.&Supposedly the best cakes in town.",
        "What's this? They have some of #Grunkle Stans's hair in them...",
        45,
        20
    );
    _item_info[ITEM_INDEX.CHIPACKERZ] = ItemInfo(
        ITEM_INDEX.CHIPACKERZ,
        "Chipackerz",
        "The Chip-flavored Crackers!&Not to be confused with Crackips.",
        "They look like crackers...#`but they taste like chips..",
        50,
        20
    );
    _item_info[ITEM_INDEX.HAMSTICK] = ItemInfo(
        ITEM_INDEX.HAMSTICK,
        "Ham-on-a-Stick",
        "A large slab of meat on a #stick, fresh from Meat Cute!",
        "Extreme lunch meats are the food #of the future!",
        120,
        45
    );
    _item_info[ITEM_INDEX.PIZZA_REFRESHING] = ItemInfo(
        ITEM_INDEX.PIZZA_REFRESHING,
        "[Re] PIZZA!",
        "Soos's infinite pizza slice.&Will regenerate at time rifts.",
        "You can't eat what isn't there.&Grow some patience, monster.",
        0,
        10,
        false,
        ITEM_INDEX.PIZZA_REFRESHING
    );
    _item_info[ITEM_INDEX.PIZZA_INFINITE] = ItemInfo(
        ITEM_INDEX.PIZZA_INFINITE,
        "PIZZA!",
        "Soos's infinite pizza slice.&Reforms at time rifts.",
        "Remember Soos as it reforms.&Credits: @ef7000Spin Clipper@ffffff.",
        0,
        10,
        true,
        ITEM_INDEX.PIZZA_REFRESHING
    );
    _item_info[ITEM_INDEX.SMILE_DIP] = ItemInfo(
        ITEM_INDEX.SMILE_DIP,
        "Smile Dip",
        "The classic sugarish snack.&Banned in 27 countries.",
        "You feel weird...&What was that about 27 countries...?",
        90,
        40
    );
    _item_info[ITEM_INDEX.COOKIE_JAR_EMPTY] = ItemInfo(
        ITEM_INDEX.COOKIE_JAR_EMPTY,
        "[E] Cookie Jar",
        "Jar of Slow the Cookie Man.&Maybe someone can fill it?",
        "You gnawed on the ceramic, #but it didn't taste very good.",
        0,
        20,
        false,
        ITEM_INDEX.COOKIE_JAR_EMPTY
    );
    for (var i = ITEM_INDEX.COOKIE_JAR_1; i < ITEM_INDEX.COOKIE_JAR_FULL; ++i)
    {
        var _cookie_count = i - ITEM_INDEX.COOKIE_JAR_EMPTY;
        _item_info[i] = ItemInfo(
            i,
            $"[{_cookie_count}] Cookie Jar",
            $"Jar of Slow the Cookie Man.&A baker could top it off.",
            "You stole the cookies #from the cookie jar!",
            0, // can't be bought or sold; you lack a food handler's permit
            20,
            true,
            i - 1
        );
    }
    _item_info[ITEM_INDEX.COOKIE_JAR_FULL] = ItemInfo(
        ITEM_INDEX.COOKIE_JAR_FULL,
        $"[{ITEM_INDEX.COOKIE_JAR_FULL - ITEM_INDEX.COOKIE_JAR_EMPTY}] Cookie Jar",
        "It's completely full.&Small jar or big cookies?",
        "Who stole the cookies #from the cookie jar?",
        0,
        20,
        true,
        ITEM_INDEX.COOKIE_JAR_FULL - 1
    );
    _item_info[ITEM_INDEX.SPAGHETTI] = ItemInfo(
        ITEM_INDEX.SPAGHETTI,
        "T-1 Spaghetti",
        "A delicious bowl of spaghetti.&A famous skeleton's recipe.",
        "SOMEBODY TOUCH-A MY SPAGHET!&...this was written a while ago.",
        300,
        -1
    );
    for (var i = ITEM_INDEX.ONION_1; i <= ITEM_INDEX.ONION_MAX; ++i)
    {
        var _layer_count = i - ITEM_INDEX.ONION_1 + 1;
        _item_info[i] = ItemInfo(
            i,
            $"[{_layer_count}] Onionsan",
            "It's an onion.&Comes in many layers.",
            "It's just like ogres:&It makes you cry...",
            16 * _layer_count,
            8,
            true,
            (i == ITEM_INDEX.ONION_1) ? ITEM_INDEX.NONE : (i - 1)
        );
    }
    //FAIRY_DUST,
    //PB_SHARD,
    _item_info[ITEM_INDEX.HOLY_WATER] = ItemInfo(
        ITEM_INDEX.HOLY_WATER,
        "Holy Moley Water",
        "Seems as legit as it comes.&Dispels Undead and some other types.",
        "It tastes like tap water.&There's a better use for this...",
        40,
        5
    );
    //JERKY,
    _item_info[ITEM_INDEX.PITT_COLA] = ItemInfo(
        ITEM_INDEX.PITT_COLA,
        "Pitt Cola",
        "A common refreshing beverage.&\"It's the pitts!\"",
        "What's this in there...?&I always forget about the pit.",
        20,
        12
    );
    //MABEL_JUICE,
    //GIDEON_DOLL,
    //LOTION,
    //WHISTLE,
    _item_info[ITEM_INDEX.MAGIC_ARMOR] = ItemInfo(
        ITEM_INDEX.MAGIC_ARMOR,
        "Magic Armor",
        "Almost as strong as Plot Armor.&Could even revive the dead.",
        "You acquired the unacquirable.&You have my respect.",
        0, // Set it to whatever the user has, plus the combined sale price of all of their items, plus 1
        0,
        false
    );
    return _item_info; // returning is about the only way to force type hinting :( I hate GML - more like FML, amirite?
}
