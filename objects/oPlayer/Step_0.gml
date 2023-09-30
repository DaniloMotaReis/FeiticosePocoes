if ( life < 0){
state = player_states_death;
} else if (keyboard_check_pressed(ord("e"))){
state = player_states_atack;
}  else {
state = player_states_free;
}


hspd = lengthdir_x(move_spd,move_dir);

var ground = place_meeting(x,y+1,oColisao);


if(ground){
	coyote_time = coyote_time_max;
} else{
	coyote_time--;
}


if(key_jump and coyote_time > 0) {
	coyote_time = 0;
	vspd = 0;
	vspd-=jump_height;
}

if(key_shoot){
	if global.canshoot == true{
	sprite_index = sPlayerA;
	with (instance_create_layer(_xx,y-10,"Shoot",oTiro)){
		speed = 10;
		direction = -180 + 90 * other.image_xscale;
		image_angle = direction;
	
		
		
		}
		
		global.canshoot = false;
		alarm [0] = room_speed * 0.3;
		
	}
	
}

if(key_left){
	sprite_index=sPlayerA
	image_xscale=-2;
} else if(key_right){
	sprite_index=sPlayerA
	image_xscale=2;
} else{
	sprite_index=sPlayerP
}
state();
