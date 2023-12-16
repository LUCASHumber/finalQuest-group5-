/// @description Insert description here
// You can write your code in this editor

obj_player.hits -= 1;
obj_player.x = obj_player.previous_grounded_x;
obj_player.y = obj_player.previous_grounded_y;
alarm_set(0,room_speed*1);



