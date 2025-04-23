obj_enemy_one.enemyHealth -= arrowDamage; 
sprite_index = spr_enemy_one_take_damage;
if(obj_enemy_one.enemyHealth <= 0){
	sprite_index = spr_enemy_one_death;
	instance_destroy();	
}