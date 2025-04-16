//movement
x -= speed;

if(!can_shoot && x < room_width -200)
{
	speed = 0;
	can_shoot = true;
	alarm[0] = 60;
}

