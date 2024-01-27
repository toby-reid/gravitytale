///@desc draw self
draw_self()
if audio_is_playing(sfx_barrierClosing) for(var i = 0; i < 4; i++)
	draw_line_color(x+irandom(6)-3,y+irandom(6)-3,obj_soul.x+irandom(6)-3,obj_soul.y+irandom(6)-3,0xff4123,0xff4123)