if(dead)
{
	audio_stop_sound(boss_music);
	room_goto(win_screen);
}

switch(state){
	case "idle":
		//idle sprite here
		state_timer --;
		
		var dir_x = sign(obj_player.x - x);
		x += dir_x * moveSpd;
		image_xscale = dir_x;
		
		//collision if needed here
		
		if (state_timer <= 0){
			state = "attack";
			state_timer = 30;
		}
		break;
		
	case "attack":
		//attack sprite here
		if(state_timer == 15){
			instance_create_layer(x,y,"Instances",obj_enemy_two_bullets);
		}
		
		state_timer--;
		if(state_timer <= 0){
			state = "idle";
			state_timer = 90;
		}
		break;
		
	case "hurt":
		//hurt sprite here
		state_timer--;
		if(state_timer <= 0){
			state = "idle";
			state_timer = 60;
		}
		break;
	case "dead":
		//death sprite
		image_speed = 0.3;
		dead = true;
		break;
}