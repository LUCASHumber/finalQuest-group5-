/// @description collition with platform

if(place_meeting(x,y,obj_platform))
{
	obj_player.can_grapple = true;
obj_player.is_shooting = false;
obj_player.is_grappled = true;

speed = 0;
show_debug_message("true");
}

hook_x = x;
hook_y = y;

