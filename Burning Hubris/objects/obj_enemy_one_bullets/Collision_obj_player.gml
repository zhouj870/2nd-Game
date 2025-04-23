with(other)
{
	hp -= 1;
	sprite_index = spr_player_take_damage;
	if(hp <= 0){
		sprite_index = spr_player_dying;
		instance_destroy();
	}
	
}
instance_destroy();

