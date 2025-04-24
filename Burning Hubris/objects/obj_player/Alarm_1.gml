if(hp <= 0)
{
	sprite_index = spr_player_dying;
	image_speed = 0.3
	instance_destroy();
	room_goto(lose_screen); 
}