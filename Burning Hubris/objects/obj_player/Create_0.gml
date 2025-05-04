//movement controls
xspd = 0;
yspd = 0;
moveDir = 0;
face = 1;
moveSpeed = 4;

//stats
max_hp = 100;
hp = max_hp;
flameGauge = 100; 
death = false;
dmgCoolDown = 0;

//shooting
can_shoot = true;
shoot_cooldown = 10; 
shoot_timer = 0;


//jump
grav = 0.2;
termVel = 4;
jspd =	-6.25;


//sprites
currentState = spr_player_idle;
idleSpr = spr_player_idle;
glideSpr = spr_player_glide
walkSpr = spr_player_walking;
flyingSpr = spr_player_flight;

//burning gauge
fireGauge = 100;
fireGaugeMax = 100; 
fireGaugeTickSpeed = 0.25; 
fireDamageCooldown = 30;
fireDamageTimer = 0;
fireGaugeCooldownRate = 0.2;

//Gliding
gliding = false;
onGround = place_meeting(x, y+1, obj_cloud3);

// Stop any music that might be playing already
audio_stop_sound(snd_theme);
audio_stop_sound(boss_music);

// Decide music based on room
if (room == boss_room) {
    global.music_mode = "boss";
    audio_play_sound(boss_music, 1, true); // Loop boss music
} else {
    global.music_mode = "theme";
    audio_play_sound(snd_theme, 1, true); // Loop theme music
}

