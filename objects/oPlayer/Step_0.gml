if ( life < 0){
state = player_states_death;
} else if (keyboard_check_pressed(ord("e"))){
state = player_states_atack;
}  else {
state = player_states_free;
}
state();


