if(alarm[1] < 0)
{
	hp -= other.dmg;
	
	alarm[1] = 20;
}
instance_destroy(other);