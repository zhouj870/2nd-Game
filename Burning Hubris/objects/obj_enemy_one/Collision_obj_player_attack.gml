enemyHealth -= other.arrowDamage;
sprite_index = spr_enemy_one_take_damage;

if(enemyHealth <= 0){
	sprite_index = spr_enemy_one_death;
	instance_destroy();	
}