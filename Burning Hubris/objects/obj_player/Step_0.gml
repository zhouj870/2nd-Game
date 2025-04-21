var rightKey = keyboard_check(vk_right) || keyboard_check(ord("D"));
var leftKey = keyboard_check(vk_left) || keyboard_check(ord("A"));
var jumpKey = keyboard_check_pressed(vk_up) || keyboard_check(ord("W"));
var downKey = keyboard_check(vk_down) || keyboard_check(ord("S"));
var dodgeKey = keyboard_check(vk_space);
var attackKey = keyboard_check_pressed(ord("F")) || mouse_check_button_pressed(mb_left);

//x movement 
moveDir = rightKey - leftKey;

if moveDir != 0 {face = moveDir;};
image_xscale = face; 

if place_meeting(x+xspd, y, obj)
{
	xspd = 0;
}
else 
{
	x += xspd;
}

yspd += grav;

if yspd > termVal {yspd = termVal};

if place_meeting(x, y+yspd, obj)
{
	yspd = 0;
}
else 
{
	y += yspd;
}
// Check if player is on the ground
if place_meeting(x, y + 1, obj)
{
	onGround = true;
}
else
{
	onGround = false;
}

// Jumping
if canGlide && jumpKey && onGround
{
	yspd = jspd;
	onGround = false;
}

// Gliding
if canGlide && !onGround && yspd > 0
{
	sprite_index = glideSpr;
}
// Start dodge
if dodgeKey && !isDodging && moveDir != 0 && onGround {
	isDodging = true;
	dodgeTimer = dodgeTime;
}

// Apply dodge if active
if isDodging {
	xspd = moveDir * dodgeSpeed;
	dodgeTimer -= 1;
	sprite_index = flyingSpr;
	
	if (dodgeTimer <= 0) {
		isDodging = false;
	}
}
//attack 
if (!can_shoot) {
    shoot_timer--;
    if (shoot_timer <= 0) {
        can_shoot = true;
    }
}
if (mouse_check_button_pressed(mb_left)|| keyboard_check_pressed(ord("F")) && can_shoot) {
    var arrow = instance_create_layer(x, y, "Instances", obj_player_attack);
	var angle = point_direction(x, y, mouse_x, mouse_y);
    arrow.direction = angle;
	arrow.image_angle = angle;
	arrow.speed = 10;
	
	can_shoot = false;
    shoot_timer = shoot_cooldown;
}
if (fireGauge < fireGaugeMax) {
   fireGauge += fireGaugeTickSpeed;
    if (fireGauge > fireGaugeMax) {
        fireGauge = fireGaugeMax;
    }
}
if (fireGauge >= fireGaugeMax) {
    canGlide = false;

    // Burn damage logic
    fireDamageTimer++;
    if (fireDamageTimer >= fireDamageCooldown) {
        hp -= 2; // apply damage
        fireDamageTimer = 0;
    }
} else {
    canGlide = true;
    fireDamageTimer = 0; // reset burn timer if not burning
}
// Sprite handling
if onGround
{
	if abs(xspd) > 0 {
		sprite_index = walkSpr;
	} else {
		sprite_index = idleSpr;
	}
}
else
{
	if yspd > 0 {
		sprite_index = glideSpr; // falling
	} else {
		sprite_index = flyingSpr; // going up
	}
}





