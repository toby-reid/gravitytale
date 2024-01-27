image_alpha = 0
image_speed = 0
image_yscale = 2
image_xscale = 2
alarm[0] = 60

scr_setmap()

enum player {
	name,
	mabel,//true/false, whether you're Mabel
	hours,
	minutes,
	seconds,
	kills,
	spares,
	hp,
	maxhp,
	money,
	lv,//max 19, until you kill stans
	nyarf,//0 nothing, 1 nyarf, 2 nyarf/hat, 3 nyarf/DF, 4 AT/hat, 5 AT/DF
	bonus,//0 none, 1 shoulderbag, 2 piggerbag, 3 shoulder&pigger, 4 coupon, 5 shoulder&coupon, 6 pigger&coupon, 7 all
	runActive,//0 neutral, 1 pacifist, 2 genocide
	portalPotty,//0 none, adds 1 each time a portal is created, max 4
	pic,//true beaver pic
	total
}
scr_rst_global_player()
audio_group_load(Music)
audio_group_load(Talk)
audio_group_load(SFX)
global.menu = [0,0]
global.battleTimer = 0//I would do an alarm, but I only want it going down when not in battle rooms

enum enemy {
	blendin,//from SCB
	beaver,//BONUS - with a chainsaw
	soos,//FINAL - SCB
	manlydan,
	tyler,//paired with mDan
	robbie,
	sheriff,
	deputy,//paired with sheriff
	salesman,//BONUS - in the mShack
	ford,//FINAL - FST
	stans_cave,//BONUS - req. for pacifist. Can be "killed," but only used for Stans's data
	leaderaur,//BONUS - in the mancave
	bmgnome,//black market gnome
	ghosts,//plural. Can only be spared. Likely to be unused, but that's ok
	qt,//Quentin Trembley III, in place of ghosts on Geno. Can only be killed.
	wendy,//FINAL - CAV
	zboyfriend,//zombie boyfriend - actually Gnomes. A single Gnome killed results in zbf killed; all spared results in zbf spared
	pacifica,
	ptbros,//BONUS - pterodactyl bros
	gidtv,//specifically the TV on wheels. Battled multiple times throughout the Tunnels
	asmgnomes,//Gnomezilla. A single Gnome killed results in asm killed; all spared results in asm spared.
	karen,//BONUS - if player.spares == 0, it'll be killed; else if player.kills == 0, it'll be spared; else it'll be both.
	gideon,//FINAL - TOT. Not encountered in geno.
	mcg,//FINAL - TOT. Geno only. Cannot be spared. Killing him results in gideon killed also.
	stans_geno,//Genocide only. Can be spared, but only for the gag. Spared will not last.
	shmebulock,//the ultimate Gnome. Fires almost impossible amount of Gnomes your way, but super weak.
	timebaby,//FINAL - UFO
	bill_nightmare,//neutral final boss. Probably unused, but I'll leave it in just in case
	bill_physical,//pacifist final boss. Probably unused, but I'll leave it in just in case
	mabel,//genocide only. Probably unused, but I'll leave it in just in case
	wayman,//BONUS - found in many places.
	total//used for the below declaration for simplicity in array_length.
}
global.killed[enemy.total] = false
global.spared[enemy.total] = false

//Item database
enum item {
	none,
	loser_candy,
	popsicle,
	milk,
	milk2,
	pancake,
	chipackerz,
	hamstick,
	infinite_pizza,
	refreshing_pizza,
	smile_dip,
	cookie3,//Make an item for this!
	cookie2,
	cookie1,
	cookie0,
	spaghetti,
	onion16,
	onion15,
	onion14,
	onion13,
	onion12,
	onion11,
	onion10,
	onion09,
	onion08,
	onion07,
	onion06,
	onion05,
	onion04,
	onion03,
	onion02,
	onion01,
	//fairy_dust,
	//pb_shard,
	holy_water,
	//jerky,
	pitt_cola,
	//mabel_juice,
	//gideon_doll,
	//lotion,
	//whistle,
	magic_armor,
	total
}
enum item_info {
	name,
	desc,
	response,
	heal,
	price,
	total
}
global.item_index = ds_grid_create(item.total, item_info.total)
ds_grid_clear(global.item_index,0)
scr_create_item(item.none,				"",					"Literally nothing.",												"You ate nothing.&... Good job?",0,0)
scr_create_item(item.loser_candy,		"Loser Candy",		"Some old, unwanted Halloween #candy.",								"You feel sick.",5,15)
scr_create_item(item.popsicle,			"Popsicle",			"A Popsicle-on-a-Stick.&Somehow, it's always frozen.",				"The stick has a skeleton pun.&How dreadful.",10,25)
scr_create_item(item.milk,				"[2] LanLan Milk",	"From the Legend of Zeppeli.&Contains 2 doses.",					"Drank half.&Make sure to pace yourself.",10,55)
scr_create_item(item.milk2,				"[1] LanLan Milk",	"From the Legend of Zeppeli.&Half the bottle remains.",				"Finished the bottle.&Discarded the empty bottle.",10,20)
scr_create_item(item.pancake,			"Stancake",			"Retrieved from Greasy's.&Supposedly the best cakes in town.",		"What's this? They have some of #Grunkle Stans's hair in them...",20,45)
scr_create_item(item.chipackerz,		"Chipackerz",		"The Chip-flavored Crackers!&Not to be confused with Crackips.",	"They look like crackers...#`but they taste like chips..",20,50)
scr_create_item(item.hamstick,			"Ham-on-a-Stick",	"A large slab of meat on a #stick, fresh from Meat Cute!",			"Extreme lunch meats are the food #of the future!",45,120)
scr_create_item(item.infinite_pizza,	"PIZZA!",			"Soos's infinite pizza slice.&Reforms at time rifts.",				"Remember Soos as it reforms.&Also @ef7000Spin Clipper@ffffff.",10,0)
scr_create_item(item.refreshing_pizza,	"[Re] PIZZA!",		"Soos's infinite pizza slice.&Will regenerate at time rifts.",		"You can't eat what isn't there.&Grow some patience, monster.",10,0)
scr_create_item(item.smile_dip,			"Smile Dip",		"Smile Dip.&Banned in 27 countries.",								"You feel weird...&What was that about 27 countries...?",40,90)
scr_create_item(item.cookie3,			"[3] Cookie Jar",	"Jar of Slow the Cookie Man.&It holds 3 cookies.",					"ME LOVE COOKIE&2 cookies left.",20,0)
scr_create_item(item.cookie2,			"[2] Cookie Jar",	"Jar of Slow the Cookie Man.&There are 2 cookies left.",			"MORE COOKIE&1 cookie remains.",20,0)
scr_create_item(item.cookie1,			"[1] Cookie Jar",	"Jar of Slow the Cookie Man.&1 cookie remains.",					"Welp, I reckon that's that.&The jar is now empty.",20,0)
scr_create_item(item.cookie0,			"[E] Cookie Jar",	"Jar of Slow the Cookie Man.&Maybe someone can fill it?",			"You gnawed on the glass, #but it didn't taste very good.",0,0)
scr_create_item(item.spaghetti,			"T-1 Spaghetti",	"A delicious bowl of spaghetti.&A famous skeleton's recipe.",		"Delicious.",-1,300)
for(var i = 0; i < 16; i++) scr_create_item(item.onion16+i,"["+string(16-i)+"] Onionsan","It's an onion.&Comes in many layers.","It's just like ogres:&It makes you cry...",4,40)//we wanna leave this at 40, so it's random what kind of onion you get
//scr_create_item(item.fairy_dust,		"Fairy Dust",		"Knocks out all grunts for a few #turns.",							"Don't use that on yourself!&Wait til you're in battle...",0,50)
scr_create_item(item.holy_water,		"Holy Moley Water",	"Seems as legit as it comes.&Dispels Undead and some other types.",	"It tastes like tap water.&There's a better use for this...",5,20)
scr_create_item(item.pitt_cola,			"Pitt Cola",		"A common refreshing beverage.&\"It's the pitts!\"",				"What's this?&I always forget about the pit...",12,20)
scr_create_item(item.magic_armor,		"Magic Armor",		"Can't actually be acquired.&Funny how that works.",				"Hmm, not sure how you got that #or consumed it, but ok.",0,50000);

global.inventory = [0,0,0,0,0,0,0,0]
order = 0

/*
Files used:
Reset.save - "C","N"/P/G/W,#timesCompleted/WaymanDefeated?; "R","R",0none/1neut/2pac/3geno just reset; "K",enemy.#,T/F killed; "S",enemy.#,T/F spared; "D",enemy.#,# died
Info.save  - "Profile","NM"/LV/HR/MN/SC/RM/MS,string except for MS name/lv/hour/minute/second/room/music
Save.save  - game save file
*/

enum area {
	unknown,
	scuttlebutt,
	forest,
	caves,
	tent,
	ufo,
	total
}
global.areaKilled[area.total] = 0
global.areaMax = [0,18,25,20,20,20,0]