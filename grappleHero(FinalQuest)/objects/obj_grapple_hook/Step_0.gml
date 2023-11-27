/// @description 


if(distance_to_object(obj_player) >= line_length_max){
	direction = point_direction(x,y,obj_player.x,obj_player.y)
	image_angle = direction
	speed *= -3;
} 




if(obj_player.state = player_state.grapple and place_meeting(x,y,obj_platform))
{
	if(obj_player.shoot_grapple)
	{
		direction = point_direction(x,y,obj_player.x,obj_player.y)
	image_angle = direction
	speed *= -3;
	}
}
