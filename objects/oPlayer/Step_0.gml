var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_jump = keyboard_check_pressed(vk_space);
var key_shoot = keyboard_check(ord("E"));

var move = key_right - key_left != 0;

var flipped = direction;
var gun_x = (x+4) * (flipped);
var _xx = x + lengthdir_x(15, image_angle);
var y_offset = lengthdir_y(-20, image_angle);


vspd+=grv;
vspd = clamp(vspd,vspd_min,vspd_max);


if(move){
	move_dir = point_direction(0,0,key_right - key_left,0);
	move_spd = approach(move_spd,move_spd_max,acc);
} else {
	move_spd = approach(move_spd,0,dcc);
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
	sprite_index = sPlayerA;
	with (instance_create_layer(_xx,y-10,"Shoot",oTiro)){
		speed = 10;
		direction = -180 + 90 * other.image_xscale;
		image_angle = direction;
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