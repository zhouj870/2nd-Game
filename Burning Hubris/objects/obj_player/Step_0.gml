// Key Input
var rightKey = keyboard_check(vk_right) || keyboard_check(ord("D"));
var leftKey = keyboard_check(vk_left) || keyboard_check(ord("A"));
var jumpKey = keyboard_check_pressed(vk_space);
var downKey = keyboard_check(vk_down) || keyboard_check(ord("S"));
var holdJump = keyboard_check(vk_space); // for glide logic
var attackKey = keyboard_check_pressed(ord("F")) || mouse_check_button_pressed(mb_left);

//Player movement
#region
//move direction
moveDir = rightKey - leftKey;
if (moveDir != 0) {
    face = moveDir;
    image_xscale = face;
}
xspd = moveDir * moveSpeed;

// X Collision
if (place_meeting(x + xspd, y, obj_cloud3)) {
    while (!place_meeting(x + sign(xspd), y, obj_cloud3)) {
        x += sign(xspd);
    }
    xspd = 0;
}
x += xspd;

//y Col
yspd += grav;
if (yspd > termVel) yspd = termVel;

// Check ground
onGround = place_meeting(x, y + 1, obj_cloud3);

// Jump
if (jumpKey && onGround) {
    yspd = jspd;
}

//gliding
gliding = false;
if (!onGround && yspd > 0.5 && fireGauge > 0 && holdJump) {
    gliding = true;
    yspd = 1.5; // smoother fall
    fireGauge -= fireGaugeTickSpeed;
    if (fireGauge < 0) fireGauge = 0;
} else if (!onGround && !gliding && fireGauge < fireGaugeMax) {
    fireGauge += fireGaugeCooldownRate;
    if (fireGauge > fireGaugeMax) fireGauge = fireGaugeMax;
}

if (place_meeting(x, y + yspd, obj_cloud3)) {
    while (!place_meeting(x, y + sign(yspd), obj_cloud3)) {
        y += sign(yspd);
    }
    yspd = 0;
}
y += yspd;

#endregion

//attack 
#region
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
if (sprite_index == spr_player_transition_attack && image_index >= image_number - 1) {
    sprite_index = idleSpr; // or your default sprite
}
#endregion



//if(abs(xspd) > 0) { sprite_index = walkSpr}
//else if(onGround && xspd == 0) {sprite_index = idleSpr};
