enemyHealth -= other.arrowDamage;

if(enemyHealth <= 0){
	sprite_index = spr_enemy_one_death;
	image_speed = 0.3;
	instance_destroy();	
}
instance_destroy();