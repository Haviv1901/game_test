


function handle_collision()
{
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
}

function handle_on_enemy_collision()
{
	

	// check for collision with enemy
	if (place_meeting(x, y, oEnemy) && can_be_hit())
	{
		on_hit_from_enemy();
	}
	
	if (is_in_invinsibility_frames())
	{
		flash_player();	
	}
	
	
	
	time_since_last_hit += 1
}

function flash_player()
{
	if (time_since_last_hit % TIME_BETWEEN_PLAYER_FLASHES > 0 && time_since_last_hit % TIME_BETWEEN_PLAYER_FLASHES < PLAYER_FLASH_LENGTH)
	{
		image_alpha = 0.73;
	}
	else
	{
		image_alpha = 1;
	}
	
	// for safetey, in case last frame of iFrames was flashing the player
	if (time_since_last_hit == I_FRAMES_LENGTH)
	{
		image_alpha = 1
	}
}

function is_in_invinsibility_frames()
{
	return time_since_last_hit < I_FRAMES_LENGTH
}

function can_be_hit()
{
	return !is_in_invinsibility_frames()
}


function on_hit_from_enemy()
{
	lives -= 1;
	time_since_last_hit = 0;
	vertical_speed = -4;
}

handle_collision();
handle_on_enemy_collision();







