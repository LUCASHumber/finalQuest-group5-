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
	
	restart = keyboard_check_pressed(ord("R"));
}

//plyaer collison:

//horizontal collison
if(place_meeting(x+horizontal_speed, y, obj_ground))
{
	while(!place_meeting(x+sign(horizontal_speed), y , obj_ground))
	{
		x += sign(horizontal_speed);
	}
	horizontal_speed = 0;
	
}
x += horizontal_speed;

//vertical collison
if(place_meeting(x, y+vertical_speed, obj_ground))
{
	while(!place_meeting(x, y+sign(vertical_speed), obj_ground))
	{
		y += sign(vertical_speed);
	}
	vertical_speed = 0;
	
}
y += vertical_speed;



//check if player is on the ground
if(place_meeting(x, y+1, obj_ground))
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

//switch between normal player movment state and grapple state
switch(state)
{
	case player_state.normal:
	{
		
		show_debug_message("in normal state")
		//movement, horizontal and vertical speed
		movement = right_movement - left_movement;
		horizontal_speed = movement * move_speed;
		vertical_speed = vertical_speed + player_mass;
		show_debug_message($"{movement}");
		show_debug_message($"{horizontal_speed}");
		
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
				audio_play_sound(snd_jump,0,0);	
				vertical_speed -= jump_speed;
				jump_counter = 0;
			}
		}
		
		//shoot grapple 
//show_debug_message($"can grapple: {can_grapple}")
//show_debug_message($"is grapple: {is_grappled}")
//show_debug_message($"is shooting: {is_shooting}")

		if((shoot_grapple) and can_grapple = 1 and !is_shooting) 
		{
			can_grapple = 0;
			is_shooting = true;
			var grapple_instance = instance_create_layer(x, y, layer, obj_grapple_hook);
			
	
		} else if(shoot_grapple and is_shooting){
			//obj_grapple_hook.direction =  point_direction(x,y,obj_grapple_hook.x,obj_grapple_hook.y)
			//obj_grapple_hook.image_angle = obj_grapple_hook.direction
			//obj_grapple_hook.speed *= -2;
			
		}
		
		
		if(is_grappled){
			show_debug_message("state switched to grapple")
			state = player_state.grapple
		}
		
		if(restart){
			game_restart();
			in_control_of_player = true;
		}
		
		
	}break;
	
	case player_state.grapple:
	{	
		
		show_debug_message("in grapple state");
		grappleX = obj_grapple_hook.hook_x;
		grappleY = obj_grapple_hook.hook_y;
		ropeX = x;
		ropeY = y;
		grapple_angle_vel = 0;
		grapple_angle = point_direction(grappleX, grappleY, x, y );
		grapple_length = min(point_distance( grappleX, grappleY, x, y), obj_grapple_hook.line_length_max);
			
		
		
		var grapple_angle_acc = -0.97 * dcos(grapple_angle);
        grapple_angle_acc += (right_movement - left_movement) * 3;
        grapple_length += (down_look - up_look) * 2;
		grapple_length = min(grapple_length,obj_grapple_hook.line_length_max);
        
        grapple_angle_vel += grapple_angle_acc;
        grapple_angle += grapple_angle_vel;
		grapple_angle_vel *= 0.99;
        
        ropeX = grappleX + lengthdir_x(grapple_length, grapple_angle);
        ropeY = grappleY + lengthdir_y(grapple_length, grapple_angle);
        
        horizontal_speed = ropeX - x;
        vertical_speed = ropeY - y;
		
		
		
		if(shoot_grapple)
		{
			show_debug_message($"{shoot_grapple}");
			vertical_speed -= jump_speed;
			can_grapple = 1;
			is_shooting = false;
			is_grappled = false;
			state = player_state.returning;
			show_debug_message("going to returning state");
			
		}
		
	}break;
	
	case player_state.returning:
	{
		show_debug_message($"in returning state");
		
		movement = right_movement - left_movement;
		horizontal_speed = movement * move_speed;
		vertical_speed = vertical_speed + player_mass;
		
		
	
	}break;
}





