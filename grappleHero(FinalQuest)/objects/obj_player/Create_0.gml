/// @description variables

in_control_of_player = true;
hits = 3;

horizontal_speed = 0;
vertical_speed = 0;

x_vel = 0.0;
y_vel = 0.0;
x_acc = 0.0;
y_acc = 0.0;

player_mass = 0.3;
facing_direction = 0;
vertical_direction = 0;

move_speed = 10;
jump_speed = 10;

grapple_speed = 15;
can_grapple = 1;
is_shooting = false;
is_grappled = false;
ropeInstance = noone;

previous_grounded_x = 0;
previous_grounded_y = 0;
grounded = false;

jumped = false;
jump_buffer = 5;
jump_counter = 0;
inAir = false;

state = player_state.normal;
enum player_state
{

normal, 
grapple,
returning

}




