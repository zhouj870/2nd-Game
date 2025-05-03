//damage
if(!dead && state != "hurt"){
	hp -= other.arrowDamage;
	instance_destroy(other);
}

if(hp <= 0)
{
	state = "dead";
} else {
	state = "hurt";
	state_timer = 15;
}
