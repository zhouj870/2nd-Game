enemyHealth -= other.arrowDamage;
instance_destroy(other);

if(enemyHealth <= 0){
	sprite_index = spr_enemy_one_death;
	image_speed = 0.3;
	xspd = 0;
}
