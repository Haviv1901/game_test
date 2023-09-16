
function handle_movement()
{
	x += move_speed * move_side;
	
	if (!place_meeting(x + move_speed + sprite_width * move_side, y + 1, oBlock))
	{
		switch_directions()
	}
	
	
}

function switch_directions()
{
	if (move_side == LEFT)
	{
		move_side = RIGHT;
	}
	
	else if (move_side == RIGHT)
	{
		move_side = LEFT;
	}
}

function handle_physics()
{
	vertical_speed += grav;
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

handle_movement()
handle_physics()

