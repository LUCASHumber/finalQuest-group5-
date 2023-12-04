/// @description hook variables

hook_x = 0;
hook_y = 0;
hook_active = true;

getTarget_Id = noone;

line_length = 0;
line_length_max = 250;

if(obj_player.grounded = false){
	if(obj_player.image_angle = 0){
		direction = 45;
		image_angle = direction;
		speed = 10;
	} else if(obj_player.image_angle = 180){
		direction = 135;
		image_angle = direction;
		speed = 10;
	} else if(obj_player.image_angle = 90){
		direction = obj_player.image_angle;
		image_angle = direction;
		speed = 10;
	}
} else {
direction = obj_player.image_angle;
image_angle = direction;
speed = 10;
}
