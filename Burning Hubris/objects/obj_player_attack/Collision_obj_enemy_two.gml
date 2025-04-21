while(other){
	
	enemyHealth -= arrowDamage; 
	sprite_index = spr_enemy_two_take_damage;
	
	if(enemyHealth <= 0){
		sprite_index = spr_enemy_two_death;
		instance_destroy();	
	}
	
}