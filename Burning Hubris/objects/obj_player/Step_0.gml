var rightKey = keyboard_check(vk_right) || keyboard_check(ord("D"));
var leftKey = keyboard_check(vk_left) || keyboard_check(ord("A"));
var jumpKey = keyboard_check_pressed(vk_up) || keyboard_check(ord("W"));
var downKey = keyboard_check(vk_down) || keyboard_check(ord("S"));
var dodgeKey = keyboard_check(vk_space);
var attackKey = keyboard_check(ord("F")) || keyboard_check(mb_left);
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
if jumpKey && onGround
{
	yspd = jspd;
	onGround = false;
}

// Gliding
if !onGround && yspd > 0
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
	
	
	if (dodgeTimer <= 0) {
		isDodging = false;
	}
}
//attack 

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





