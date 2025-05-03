if(dead)
{
	room_goto(win_screen);
}

switch(state){
	case "idle":
		//idle sprite here
		state_timer --;
		
		x += facing *moveSpd;
		
		//collision if needed here
		
		if (state_timer <= 0){
			state = "attack";
			state_timer = 30;
		}
		break;
		
	case "attack":
		//attack sprite here
		if(state_timer == 15){
			//attack added here
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