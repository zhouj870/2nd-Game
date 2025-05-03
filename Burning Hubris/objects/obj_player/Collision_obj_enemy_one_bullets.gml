if(dmgCoolDown <= 0)
{
	hp -= other.dmg;
	dmgCoolDown = 20;
	
}
instance_destroy(other);