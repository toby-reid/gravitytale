function scr_generate_item_index() {
	/// @desc Creates the global.ITEM struct for all known items.
	enum ITEM_NAME {
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
	global.ITEM = ds_map_create();
	global.ITEM[? ITEM_NAME.NONE] = {
		name: "",
		description: "Literally nothing.",
		usable: false,
		useResponse: "You ate nothing.&...Good job?",
		heal: 0,
		price: 0,
		useResult: ITEM_NAME.NONE
	};
	global.ITEM[? ITEM_NAME.LOSER_CANDY] = {
		name: "Loser Candy",
		description: "Some old, unwanted Halloween #candy.",
		usable: true,
		useResponse: "You feel sick.",
		heal: 5,
		price: 15,
		useResult: ITEM_NAME.NONE
	};
	global.ITEM[? ITEM_NAME.POPSICLE] = {
		name: "Popsicle",
		description: "A Popsicle-on-a-Stick.&Somehow, it's always frozen.",
		usable: true,
		useResponse: "The stick has a skeleton pun.&How dreadful.",
		heal: 10,
		price: 25,
		useResult: ITEM_NAME.NONE
	};
	global.ITEM[? ITEM_NAME.MILK_HALF] = {
		name: "[1] LanLan Milk",
		description: "From the Legend of Zeppeli.&Half the bottle remains.",
		usable: true,
		useResponse: "Discarded the empty bottle.&Don't drive yourself home.",
		heal: 10,
		price: 15,
		useResult: ITEM_NAME.NONE
	};
	global.ITEM[? ITEM_NAME.MILK_FULL] = {
		name: "[2] LanLan Milk",
		description: "From the Legend of Zeppeli.&Contains 2 doses.",
		usable: true,
		useResponse: "Drank half.&Make sure to pace yourself.",
		heal: 10,
		price: 55,
		useResult: ITEM_NAME.MILK_HALF
	};
	global.ITEM[? ITEM_NAME.PANCAKE] = {
		name: "Stancake",
		description: "Retrieved from Greasy's.&Supposedly the best cakes in town.",
		usable: true,
		useResponse: "What's this? They have some of #Grunkle Stans's hair in them...",
		heal: 20,
		price: 45,
		useResult: ITEM_NAME.NONE
	};
	global.ITEM[? ITEM_NAME.CHIPACKERZ] = {
		name: "Chipackerz",
		description: "The Chip-flavored Crackers!&Not to be confused with Crackips.",
		usable: true,
		useResponse: "They look like crackers...#`but they taste like chips..",
		heal: 20,
		price: 50,
		useResult: ITEM_NAME.NONE
	};
	global.ITEM[? ITEM_NAME.HAMSTICK] = {
		name: "Ham-on-a-Stick",
		description: "A large slab of meat on a #stick, fresh from Meat Cute!",
		usable: true,
		useResponse: "Extreme lunch meats are the food #of the future!",
		heal: 45,
		price: 120,
		useResult: ITEM_NAME.NONE
	};
	global.ITEM[? ITEM_NAME.PIZZA_REFRESHING] = {
		name: "[Re] PIZZA!",
		description: "Soos's infinite pizza slice.&Will regenerate at time rifts.",
		usable: false,
		useResponse: "You can't eat what isn't there.&Grow some patience, monster.",
		heal: 10,
		price: 0,
		useResult: ITEM_NAME.PIZZA_REFRESHING
	};
	global.ITEM[? ITEM_NAME.PIZZA_INFINITE] = {
		name: "PIZZA!",
		description: "Soos's infinite pizza slice.&Reforms at time rifts.",
		usable: true,
		useResponse: "Remember Soos as it reforms.&Credits: @ef7000Spin Clipper@ffffff.",
		heal: 10,
		price: 0,
		useResult: ITEM_NAME.PIZZA_REFRESHING
	};
	global.ITEM[? ITEM_NAME.SMILE_DIP] = {
		name: "Smile Dip",
		description: "The classic sugarish snack.&Banned in 27 countries.",
		usable: true,
		useResponse: "You feel weird...&What was that about 27 countries...?",
		heal: 40,
		price: 90,
		useResult: ITEM_NAME.NONE
	};
	global.ITEM[? ITEM_NAME.COOKIE_JAR_EMPTY] = {
		name: "[E] Cookie Jar",
		description: "Jar of Slow the Cookie Man.&Maybe someone can fill it?",
		usable: false,
		useResponse: "You gnawed on the glass, #but it didn't taste very good.",
		heal: 0,
		price: 0,
		useResult: ITEM_NAME.COOKIE_JAR_EMPTY
	};
	global.ITEM[? ITEM_NAME.COOKIE_JAR_1] = {
		name: "[1] Cookie Jar",
		description: "Jar of Slow the Cookie Man.&1 cookie remains.",
		usable: true,
		useResponse: "Welp, I reckon that's that.&The jar is now empty.",
		heal: 20,
		price: 0,
		useResult: ITEM_NAME.COOKIE_JAR_EMPTY
	};
	global.ITEM[? ITEM_NAME.COOKIE_JAR_2] = {
		name: "[2] Cookie Jar",
		description: "Jar of Slow the Cookie Man.&There are 2 cookies left.",
		usable: true,
		useResponse: "MORE COOKIE&1 cookie remains.",
		heal: 20,
		price: 0,
		useResult: ITEM_NAME.COOKIE_JAR_1
	};
	global.ITEM[? ITEM_NAME.COOKIE_JAR_FULL] = {
		name: "[3] Cookie Jar",
		description: "Jar of Slow the Cookie Man.&It holds 3 cookies.",
		usable: true,
		useResponse: "ME LOVE COOKIE&2 cookies left.",
		heal: 20,
		price: 0,
		useResult: ITEM_NAME.COOKIE_JAR_2
	};
	global.ITEM[? ITEM_NAME.SPAGHETTI] = {
		name: "T-1 Spaghetti",
		description: "A delicious bowl of spaghetti.&A famous skeleton's recipe.",
		usable: true,
		useResponse: "SOMEBODY TOUCH-A MY SPAGHET!&...it was delicious, at least.",
		heal: -1,
		price: 300,
		useResult: ITEM_NAME.NONE
	};
	for (var i = ITEM_NAME.ONION_1; i <= ITEM_NAME.ONION_MAX; i++) {
		var layers = i - ITEM_NAME.ONION_1 + 1;
		global.ITEM[? i] = {
			name: "[" + string(layers) + "] Onionsan",
			description: "It's an onion.&Comes in many layers.",
			usable: true,
			useResponse: "It's just like ogres:&It makes you cry...",
			heal: 4,
			price: 25,
			useResult: (layers != 1) ? i-1 : ITEM_NAME.NONE
		};
	}
	//FAIRY_DUST,
	//PB_SHARD,
	global.ITEM[? ITEM_NAME.HOLY_WATER] = {
		name: "Holy Moley Water",
		description: "Seems as legit as it comes.&Dispels Undead and some other types.",
		usable: true,
		useResponse: "It tastes like tap water.&There's a better use for this...",
		heal: 5,
		price: 40,
		useResult: ITEM_NAME.NONE
	};
	//JERKY,
	global.ITEM[? ITEM_NAME.PITT_COLA] = {
		name: "Pitt Cola",
		description: "A common refreshing beverage.&\"It's the pitts!\"",
		usable: true,
		useResponse: "What's this in there...?&I always forget about the pit.",
		heal: 12,
		price: 20,
		useResult: ITEM_NAME.NONE
	};
	//MABEL_JUICE,
	//GIDEON_DOLL,
	//LOTION,
	//WHISTLE,
	global.ITEM[? ITEM_NAME.MAGIC_ARMOR] = {
		name: "Magic Armor",
		description: "Can't actually be acquired.&Funny how that works.",
		usable: false,
		useResponse: "Hmm, not sure how you got that #or consumed it, but ok.",
		heal: 0,
		price: 0, // Set it to whatever the user has, plus the combined cost of all of their items, plus 1
		useResult: ITEM_NAME.NONE
	};
}
