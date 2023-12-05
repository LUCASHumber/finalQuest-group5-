/// @description collition with player on return
// You can write your code in this editor
obj_player.can_grapple = 1;
obj_player.is_shooting = false;
obj_player.state = player_state.normal;
instance_destroy(self);

