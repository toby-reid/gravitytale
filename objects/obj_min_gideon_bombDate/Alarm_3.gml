/// @desc Fanfare for victory or failure
obj_dipper.canMove = false; // it begins
if (instance_exists(obj_textbox))
{
    alarm[3] = 1;
    exit;
}
if (y < camera_get_view_y(view_camera[0]) + 20)
{
    ++y;
    alarm[3] = 12;
    exit;
}
var _success = doll_count == 0;
audio_play_sound(_success ? mus_showtime : mus_gameshow_tv, 0, true);
with instance_create_layer(160, 192, layer, obj_textbox)
{
    set_text([
        _success
            ? "AAAND THAT'S A WRAP!&Y'ALL DID GREAT!"
            : "TIME'S UP!&IT'S A LOST CAUSE!",
        "WELL, THESE PROP DOLLS AND #PROP FLAMES AND #PROP HIGHLY COMBUSTIBLE FUMES",
        "WERE OF COURSE NEVER A THREAT!",
        "THAT'S RIGHT, FOLKS!&I'D NEVER PUT THE GOOD FOLKS OF #GRAVITY FALLS IN DANGER!",
        _success
            ? string_concat(
                "TO KEEP OUR GUEST ON H",
                global.player.mabel ? "ER" : "IS",
                " TOES!&...WHICH TOES AND FEET ",
                global.player.mabel ? "S" : "",
                "HE #SHOULD USE TO LEAVE QUICKLY!"
            )
            : "AS A SIDE NOTE, I'D LIKE OUR #GUEST TO EXIT THESE MINES #QUICKLY!",
        "TRY TO DO SO WITHOUT STIRRING #UP STATIC ELECTRICITY!",
        "NO DANGER, OF COURSE!&JUST THINK OF IT AS A SPECIAL #CHALLENGE!",
        ". . .",
        "Can y'all hapdoodlers #hear my horrifying voice #down there?",
        "I been hearin' some nasty #earstuffs 'bout some poi-#son whatsits in the air?",
        "I knew it!&I right told y'all!",
        "Them governt been puttin' #chemicals in the water #to bloat the frogs!",
        "Don't y'all worry though!&I been pumping out those #mines on the daily!",
        "Jest remember that next #time y'all call me an old #windbat!",
        "Welp, I'll be around.&Call me if y'all need me!",
        ". . .",
        ". . .",
        "SEE, FOLKS!&IT'S JUST LIKE I SAID!&THERE WAS NO DANGER!",
        "BUT WHAT A SPECTACLE OUR GUEST #PUT FORTH!&I'M MOVED!",
        string_concat(
            global.player.mabel ? "S" : "",
            "HE TRULY CARES FOR OTHERS!&",
            global.player.mabel ? "TRULY AN ANGEL AMONG US" : "HE'S RELATED TO AN ANGEL, #AFTER ALL",
            "!"
        ),
        "THANKS FOR TUNING IN TODAY, #FOLKS!",
        "IT'S TRULY BEEN A GIFT!",
        ". . .",
        string_concat(
            "Now, between you and me, #",
            global.player.mabel ? "my queen" : "friend",
            "..."
        ),
        "That got a little more...`#@99D9EAheated@ffffff than I'da liked.",
        global.player.mabel ? "AND NOT EVEN THE NICE KIND #OF... HEAT!" : "SEE WHAT I DID THERE?",
        "ALRIGHT THEN, I'M OUT OF HERE!&SEE YOU AT MY @99D9EATENT OF TELEPATHY@ffffff!"
    ]);
    set_sound_range(tlk_gideon);
    set_sound_range(tlk_mcg, 8, 15);
    set_heads([
        spr_mcg_head_uncertain,
        spr_mcg_head_ohcrap,
        spr_mcg_head_crazy,
        spr_mcg_head_crazy,
        spr_mcg_head_suavemente,
        spr_mcg_head_crazy,
        spr_mcg_head_suavemente
    ], 8);
}
