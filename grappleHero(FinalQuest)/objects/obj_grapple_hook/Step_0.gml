/// @description 


if(distance_to_object(obj_player) >= line_length_max){
	direction = point_direction(x,y,obj_player.x,obj_player.y)
	image_angle = direction
	speed *= -3;
} 


if(obj_player.state == player_state.returning)
{
	direction = point_direction(x,y,obj_player.x,obj_player.y)
	image_angle = direction
	speed = 30;
	show_debug_message($"trying to return to player with speed {speed}");
}


