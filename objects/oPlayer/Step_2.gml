repeat(abs(hspd)){
	if(place_meeting(x+sign(hspd),y,oColisao)){
		hspd = 0;
		break;
	} else {
		x+=sign(hspd);
	}
}
repeat(abs(vspd)){
	if(place_meeting(x,y+sign(vspd),oColisao)){
		vspd = 0;
		break;
	} else {
		y+=sign(vspd);
	}
}