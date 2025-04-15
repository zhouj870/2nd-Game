if(!is_charging && !can_attack)
{
	if(instance_exists(obj_player))
	{
		var playerDis = point_direction(x, y, obj_player.x, obj_player.y);	
	
	
		if(playerDis < range)
		{
		is_charging = true;
		alarm[0] = chargeTimer;
		}
	}
}