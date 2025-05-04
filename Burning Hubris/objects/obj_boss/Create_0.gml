//health
hp = 100;
max_hp = 100;

//State system 
state = "idle";
state_timer = 60;

//Attack logic
attack_cooldown = 60;
attack_timer = attack_cooldown;

//Movement
moveSpd = 3;
face = -1;

//Sprites

//Death flag
dead = false;

//Boss music
if (!audio_is_playing(boss_music)) {
    audio_stop_all(); // optional: stop previous music
    audio_play_sound(boss_music, 1, true); // true = loop
}

