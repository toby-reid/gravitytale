// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_billeyes(tilex,tiley,dipx,dipy){
	///@desc returns raw tileset value
	dipx -= 10
	dipy -= 10
	tilex = dipx-tilex
	tiley = dipy-tiley
	if abs(tilex) <= 20 and abs(tiley) <= 20 return 5//black
	else if tilex-tiley >= 0 and (tilex >= 20 or tilex-tiley >= 20) {//all green and yellow
		if mean(tilex,tiley) > 0 {//all green
			if tilex > 80 and ((tiley <= 60 and tiley > -60) or (tilex > 100 and tiley <= 80 and tiley > -80)) return 7
			else return 2
		}
		else {//all yellow
			if tiley < -80 return 8
			else return 3
		}
	}
	else {//all red and magenta
		if mean(tilex,tiley) <= 10 {//all red
			if tilex <= -75 and ((tiley <= 60 and tiley > -60) or (tilex <= -95 and tiley <= 80 and tiley > -80)) return 6
			else return 1
		}
		else {//all magenta
			if tiley > 80 return 9
			else return 4
		}
	}
}