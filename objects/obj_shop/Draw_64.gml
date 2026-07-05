draw_set_font(fnt_basic_gui)
var drawx = 32
var drawy = 261
if stage!=0 and stage<5 charCount = string_length(text[0])+5
else draw_text(drawx,drawy,"*")
drawx += string_width("* ")
for(var i = 1; i <= charCount and i <= string_length(text[0]); i++) {
	if string_copy(text[0],i,1) == "&" {
		drawx = 32
		drawy += 40
		if stage==0 or stage>=5 draw_text(drawx,drawy,"*")
		drawx += string_width("* ")
	}
	else if string_copy(text[0],i,1) == "#" {
		drawx = 32+string_width("* ")
		drawy += 40
	}
	else {
		draw_text(drawx,drawy,string_copy(text[0],i,1))
		drawx += string_width(string_copy(text[0],i,1))
	}
}
drawx = 446+(stage==0)*string_width("* ")
drawy = 261
for(var i = 1; i <= string_length(text[1]); i++) {
	if string_copy(text[1],i,1) == "#" {
		drawx = 446+(stage==0)*string_width("* ")+(drawy>=301)*(confirm)*string_width("* ")
		drawy += 40
	}
	else {
		draw_text(drawx,drawy,string_copy(text[1],i,1))
		drawx += string_width(string_copy(text[1],i,1))
	}
}

draw_text(458,421,string_concat("$", global.player.money));
draw_set_halign(fa_right)
var itemCt = 0
for(var i = 0; i < array_length(global.inventory); i++) if global.inventory[i] != ITEM_INDEX.NONE itemCt++
draw_text(602,421,string_concat(itemCt, "/", array_length(global.inventory)));
draw_set_halign(fa_left)

var sprite = spr_soul;
if(global.player.mabel) sprite = spr_soulM
if confirm draw_sprite(sprite,0,458,354+40*choice[2])
else {
	if stage == 0 draw_sprite(sprite,0,458,274+40*choice[0])
	else if stage < 5 draw_sprite(sprite,0,40,274+40*choice[1])
}