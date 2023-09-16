





function shootWeapon()
{
	firing_delay_count--;
	if ((mouse_check_button(mb_left) or keyboard_check(ord("K"))) and (firing_delay_count < 0))
	{
		firing_delay_count = firing_delay; 
  		with (instance_create_layer(x, y, "Projectiles", Ammo))  
		{
				speed = other.bullet_speed;
				direction = point_direction(x,y,mouse_x, mouse_y);
				image_angle = direction;
		}
	}  
}
 
function updateWeaponPos()
{
	x = oPlayer.x+2;
	y = oPlayer.y;
}


updateWeaponPos() 
shootWeapon(); 