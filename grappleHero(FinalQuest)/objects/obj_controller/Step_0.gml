/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("R"))){
game_restart();
}

if(obj_player.hits == 0){
	game_restart();
	
}
