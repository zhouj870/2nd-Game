while(other){
	
	enemyHealth -= arrowDamage; 
	
	if(enemyHealth <= 0){
		instance_destroy();	
	}
	
}