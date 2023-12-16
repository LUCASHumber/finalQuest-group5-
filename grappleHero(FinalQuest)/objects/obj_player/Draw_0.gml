/// @description Insert description here
// You can write your code in this editor
draw_self();

var w = sprite_get_width(spr_heart);
var h = sprite_get_height(spr_heart);
for (var i=1; i<=hits; i++)
	draw_sprite(spr_heart, 0, camera_get_view_x(view_camera[0]) + w-90 + (i*w), camera_get_view_y(view_camera[0]) + h);


