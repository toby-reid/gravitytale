/// @desc Fanfare for victory or failure
var _success = doll_count == 0;
audio_play_sound(_success ? mus_showtime : mus_gameshow_tv, 0, true);
with instance_create_layer(160, 192, layer, obj_textbox)
{
    text = [
        _success
            ? "AAAND THAT'S A WRAP!&Y'ALL DID GREAT!"
            : "TIME'S UP!&IT'S A LOST CAUSE!",
        "WELL, THESE PROP DOLLS AND PROP FLAMES AND PROP HIGHLY COMBUSTIBLE FUMES WERE OF COURSE NEVER A THREAT!",
        "THAT'S RIGHT, FOLKS!&I'D NEVER PUT THE GOOD FOLKS OF #GRAVITY FALLS IN DANGER!",
        _success 
            ? string_concat(
                "ALL TO KEEP OUR GUEST ON H",
                global.player.mabel ? "ER" : "IS",
                " TOES!&...WHICH TOES AND FEET ",
                global.player.mabel ? "S" : "",
                "HE #SHOULD USE TO LEAVE QUICKLY!"
            )
            : "AS A SIDE NOTE, I'D LIKE OUR #GUEST TO EXIT THESE MINES #QUICKLY!",
        "TRY TO DO SO WITHOUT STIRRING UP STATIC ELECTRICITY!",
        "NO DANGER, OF COURSE!&JUST THINK OF IT AS A SPECIAL CHALLENGE!",
        ". . .",
        "Hey!&Can you hapdoodlers hear me down there?",
        "I been hearin' some right nasty earstuffs 'bout some poison whatsits in the air?",
        "I knew it!&I right told y'all!",
        "Them government been puttin' chemicals in the water to bloat the frogs!",
        "Don't y'all worry though!&I been pumping out those mines on the daily!",
        "Jest remember that next time y'all call me an old kook!",
        "Right then, I'll be around.",
        ". . .",
        ". . .",
        "SEE, FOLKS!&IT'S JUST LIKE I SAID!&THERE WAS NO DANGER!",
        "BUT WHAT A SPECTACLE OUR GUEST PUT FORTH!&I'M MOVED!",
        string_concat(
            global.player.mabel ? "S" : "",
            "HE TRULY CARES FOR OTHERS!&",
            global.player.mabel ? "TRULY AN ANGEL AMONG US" : "HE'S RELATED TO AN ANGEL, AFTER ALL",
            "!"
        ),
        "THANKS FOR TUNING IN TODAY, FOLKS!",
        "IT'S TRULY BEEN A GIFT!",
        ". . .",
        string_concat(
            "Now, between you and me, ",
            global.player.mabel ? "my queen" : "friend",
            "..."
        ),
        "That got a little more...`#@99D9EAheated@ffffff than I'da liked.",
        global.player.mabel ? "AND NOT EVEN THE NICE KIND OF... HEAT!" : "SEE WHAT I DID THERE?",
        "ALRIGHT THEN, I'M OUT OF HERE!&SEE YOU AT MY @99D9EATENT OF TELEPATHY@ffffff!"
    ];
    for (var i = 0; i < array_length(text); ++i)
    {
        sound[i] = (i >= 7 && i <= 13) ? tlk_mcg : tlk_gideon;
        head[i] = noone;
    }
    head[7] = spr_mcg_head_uncertain;
    head[8] = spr_mcg_head_ohcrap;
    head[9] = spr_mcg_head_crazy;
    head[10] = spr_mcg_head_crazy;
    head[11] = spr_mcg_head_suavemente;
    head[12] = spr_mcg_head_crazy;
    head[13] = spr_mcg_head_suavemente;
}
// TODO: Remove barriers
