/// @description Set new values...
obj_sign.text = [
	"Upon this island lies a key:&A miniboss within the trees...",
	"The battle waits behind a gap,&Four rooms beyond this #puzzle map.",
	"The town his home, #a goblin sits,&Looking for his next big hits...",
	"A picture's sold for #boundless cash;&Toby offers some old trash...",
	"But take his offer; #for, with that,&You double your DF stat.",
	"You then continue on your way,&Ready for the final day,",
	"The time is drawing very near&When thou decidest what is dear:",
	"Limitless power, #glory and gold...",
	"Allies and friends, #who die and grow old...",
	"What wilt thou choose?#Which way is right?",
	"Is there a way to get #out of this plight?",
	"(Oh, man...&(Oh man, oh man...)",
	"(That was just a bunch of #symbols we don't understand...)"
]
if global.player[player.mabel] {
	obj_sign.text[11] = "(Oh, wow!&(There's definitely something #here...!)"
	obj_sign.text[12] = "(If only we had the brains or #tenacity to figure out those #symbols...)"
}
obj_sign.font = [fnt_bill_gui,fnt_bill_gui,fnt_bill_gui,fnt_bill_gui,fnt_bill_gui,fnt_bill_gui,fnt_bill_gui,fnt_bill_gui,fnt_bill_gui,fnt_bill_gui,fnt_bill_gui]
instance_destroy(obj_scb_barrier)
with instance_create_layer( 80,220,"Instances",obj_scb_barrier_closed) image_index = 1
with instance_create_layer(100,220,"Instances",obj_scb_barrier_closed) image_index = 3
if global.soos >= 7 instance_destroy()