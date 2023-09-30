
	vspd+=grv;
	vspd = clamp(vspd,vspd_min,vspd_max);


	hspd = lengthdir_x(move_spd,move_dir);
	
	if (hspd != 0){
		image_xscale = sign(hspd)*2;
	}

	var ground = place_meeting(x,y+1,oColisao);


	if(ground){
		coyote_time = coyote_time_max;
	} else{
		coyote_time--;
	}
	
	if( life < 0) {
		instance_destroy();
		room_goto_next();
	}
