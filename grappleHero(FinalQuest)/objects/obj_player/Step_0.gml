/// @description player controls

//player movement 
if(in_control_of_player)
{
	//beta test controls
	left_movement = keyboard_check(ord("A")) || keyboard_check(vk_left);
	right_movement = keyboard_check(ord("D")) || keyboard_check(vk_right);
	jump = keyboard_check_pressed(vk_space);
	up_look = keyboard_check(ord("W")) || keyboard_check(vk_up);
	down_look = keyboard_check(ord("S")) || keyboard_check(vk_down);
	shoot_grapple = keyboard_check_pressed(ord("G"));
	
	movement = right_movement - left_movement;
	
	horizontal_speed = movement * move_speed;
	
	vertical_speed = vertical_speed + player_mass;
	
	//facing_direction = image_angle;
	
}

//check direction player is facing
if(left_movement)
{
	image_angle = 180;
	facing_direction = -1;
	
}
else if(up_look)
{
	image_angle = 90;
	vertical_direction = -1;
} 
else if (right_movement)
{
	image_angle = 0;
	facing_direction = 1;

}

else if (down_look)
{
	image_angle = 270;
	vertical_direction = 1;
}


//player jump and jump buffer
if(jump)
{
	jump_counter = 0;
}
if(jump_counter < jump_buffer)
{
	jump_counter++;
	if(jump_counter <= jump_buffer && grounded)
	{
		vertical_speed -= jump_speed;
		jump_counter = 0;
	}
}



//plyaer collison:

//horizontal collison
if(place_meeting(x+horizontal_speed, y, obj_platform))
{
	while(!place_meeting(x+sign(horizontal_speed), y , obj_platform))
	{
		x += sign(horizontal_speed);
	}
	horizontal_speed = 0;
}
x += horizontal_speed;

//vertical collison
if(place_meeting(x, y+vertical_speed, obj_platform))
{
	while(!place_meeting(x, y+sign(vertical_speed), obj_platform))
	{
		y += sign(vertical_speed);
	}
	vertical_speed = 0;
}
y += vertical_speed;



//check if player is on the ground
if(place_meeting(x, y+1, obj_platform))
{
	grounded = true;
}
else 
{
	grounded = false;
}

if(grounded)
{
	previous_grounded_x = x;
	previous_grounded_y = y;
}

show_debug_message($"can grapple: {can_grapple}")
show_debug_message($"is grapple: {is_grappled}")
show_debug_message($"is shooting: {is_shooting}")
if( (shoot_grapple) and can_grapple == true and is_shooting == false) 
{
	
	
	instance_create_layer(x+50*facing_direction,y + 50 * vertical_direction,layer, obj_grapple_hook);
	
	can_grapple = false;
	is_grappling = true;
	
} else if((shoot_grapple) and is_shooting){
	obj_grapple_hook.direction =  point_direction(x,y,obj_grapple_hook.x,obj_grapple_hook.y)
	obj_grapple_hook.image_angle = obj_grapple_hook.direction
	obj_grapple_hook.speed *= -2;
	obj_grapple_hook.hook_active = false;
}



