hp -= 1;

instance_destroy(other);

if(hp <= 0) 
{
	kill_enemy();
}
