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

//shooting
can_shoot = true;
shoot_cooldown = 10; 
shoot_timer = 0;

//dodge
dodgeSpeed = 6; 
dodgeTime = 10; 
dodgeTimer = 0;
isDodging = false;

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
fireGaugeTickSpeed = 0.5; 
fireDamageCooldown = 30;
fireDamageTimer = 0;
fireGaugeCooldownRate = 0.2;

//Gliding
gliding = false;
onGround = true;