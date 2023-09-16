// keybaord input
key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space) or keyboard_check(ord("W"));

// moving calculation
var move = key_right - key_left; 
horizontal_speed = move * walk_speed;
vertical_speed = vertical_speed + grav

if(place_meeting(x, y+1, oBlock) and key_jump)
{
	vertical_speed = -10
}

// Horizontal collision
if(place_meeting(x+horizontal_speed, y, oBlock))
{
	while(!place_meeting(x+sign(horizontal_speed), y, oBlock))
	{
		x = x + sign(horizontal_speed);	
	}
	horizontal_speed = 0;
}
// set players cords
x = x + horizontal_speed;

// Vertical collision
if(place_meeting(x, y + vertical_speed, oBlock))
{
	while(!place_meeting(x, y + sign(vertical_speed), oBlock))
	{
		y = y + sign(vertical_speed);	
	}
	vertical_speed = 0;
}
// set players cords
y = y + vertical_speed;





