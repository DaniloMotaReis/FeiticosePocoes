if ( life < 0){
state = player_states_death;
} else {
state = player_states_free;
}
state();