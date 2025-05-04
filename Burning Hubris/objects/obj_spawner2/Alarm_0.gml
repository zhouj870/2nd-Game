if(objectType != noone){
    show_debug_message("Spawning:"+ string(objectType));
    //var newEnemy = instance_create_layer(random(room_height -sprite_height), - sprite_width, layer, objectType);
    // Choose a random Y position within the room's height
    var spawn_y = irandom_range(0, room_height - sprite_height);

// Set X position just outside the right edge of the room
    var spawn_x = room_width + sprite_width;

// Create the enemy
    instance_create_layer(spawn_x, spawn_y, "Instances", obj_enemy_two);

}else{
    show_debug_message("Error: objectType is noone!");
}
alarm[0]= spawnInterval;