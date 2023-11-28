/// @description collition with platform

if(place_meeting(x,y,obj_platform) and obj_player.state != player_state.returning)
{
obj_player.can_grapple = 1;
obj_player.is_shooting = false;
obj_player.is_grappled = true;

speed = 0;
hook_x = x;
hook_y = y;

show_debug_message("grapple is touching platform")
} 



