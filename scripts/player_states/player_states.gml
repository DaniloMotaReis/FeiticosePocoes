function player_states_free(){
	var key_left = keyboard_check(ord("A"));
	var key_right = keyboard_check(ord("D"));
	var key_jump = keyboard_check_pressed(vk_space);
	var key_atack = keyboard_check_pressed(ord("e"));

	var move = key_right - key_left != 0;

	vspd+=grv;
	vspd = clamp(vspd,vspd_min,vspd_max);

	if(move){
		sprite_index=sPlayerA
		move_dir = point_direction(0,0,key_right - key_left,0);
		move_spd = approach(move_spd,move_spd_max,acc);
	} else {
		sprite_index=sPlayerP
		move_spd = approach(move_spd,0,dcc);
	}
	


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


	if(key_jump and coyote_time > 0) {
		coyote_time = 0;
		vspd = 0;
		vspd-=jump_height;
	}
}

function player_states_atack(){
	
	sprite_index = sPlayerA;
	image_speed = 1;

	var flipped = direction;
	var gun_x = (x+4) * (flipped);
	var _xx = x + lengthdir_x(15, image_angle);
	var y_offset = lengthdir_y(-20, image_angle);

	while (image_index < image_number - 1){
		with (instance_create_layer(_xx,y-10,"Shoot",oTiro)){
			speed = 10;
			direction = -180 + 90 * other.image_xscale;
			image_angle = direction;
		}
	}
}

function player_states_death(){
	hspd = 0;
	vspd = 3;
	sprite_index=sPlayerM;
	image_xscale=1.8;
	image_yscale=1.8;
	if(keyboard_check(ord("R"))){
		room_restart();
	}
	if image_index >= image_number - 1{
       image_speed = 0;
	}
}