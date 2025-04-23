// Key Input
var rightKey = keyboard_check(vk_right) || keyboard_check(ord("D"));
var leftKey = keyboard_check(vk_left) || keyboard_check(ord("A"));
var jumpKey = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var downKey = keyboard_check(vk_down) || keyboard_check(ord("S"));
var dodgeKey = keyboard_check(vk_space);
var attackKey = keyboard_check_pressed(ord("F")) || mouse_check_button_pressed(mb_left);

//move direction
moveDir = rightKey - leftKey;

if moveDir != 0 {face = moveDir;};
image_xscale = face;

//get xspd
xspd = moveDir *moveSpeed;

//x Col
if(place_meeting(x + xspd, y, obj_cloud3))
{
	xspd = 0;
}
x += xspd;

//Y Col
yspd += grav;

if(yspd > termVel) 
{
	yspd = termVel;
}

//Jump
if(jumpKey && place_meeting(x, y+1, obj_cloud3))
{
	yspd = jspd;
}

if(place_meeting(x, y + yspd, obj_cloud3))
{
	yspd = 0;
}

y += yspd;



//attack 
if (!can_shoot) {
    shoot_timer--;
    if (shoot_timer <= 0) {
        can_shoot = true;
    }
}
if ((mouse_check_button_pressed(mb_left) || keyboard_check_pressed(ord("F"))) && can_shoot) {
    var arrow = instance_create_layer(x, y, "Instances", obj_player_attack);
	var angle = point_direction(x, y, mouse_x, mouse_y);
    arrow.direction = angle;
	arrow.image_angle = angle;
	arrow.speed = 10;
	sprite_index = spr_player_transition_attack;
	can_shoot = false;
    shoot_timer = shoot_cooldown;
}



if(abs(xspd) > 0) { sprite_index = walkSpr}
else if(onGround && xspd == 0) {sprite_index = idleSpr};
