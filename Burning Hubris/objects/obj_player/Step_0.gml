// Key Input
var rightKey = keyboard_check(vk_right) || keyboard_check(ord("D"));
var leftKey = keyboard_check(vk_left) || keyboard_check(ord("A"));
var jumpKey = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var downKey = keyboard_check(vk_down) || keyboard_check(ord("S"));
var dodgeKey = keyboard_check(vk_space);
var attackKey = keyboard_check_pressed(ord("F")) || mouse_check_button_pressed(mb_left);

// Horizontal Movement
moveDir = rightKey - leftKey;

if (!isDodging) {
    xspd = moveDir * moveSpeed;
}

if (moveDir != 0) {
    face = moveDir;
}
image_xscale = face;

if (!place_meeting(x + xspd, y, obj_cloud3)) {
    x += xspd;
}

// Terminal Velocity Cap
if (yspd > termVal) {
    yspd = termVal;
}

// Ground Check with Buffer
if (place_meeting(x, y + 1, obj_cloud3)) {
    onGround = true;
    groundBuffer = 5;
} else {
    if (groundBuffer > 0) {
        groundBuffer--;
        onGround = true;
    } else {
        onGround = false;
    }
}

// Jumping
if (jumpKey && onGround) {
    yspd = -jspd;
    onGround = false;
}

// Gravity
yspd += grav;
if (yspd > termVal) {
    yspd = termVal;
}

// Vertical Movement & Collision
if (!place_meeting(x, y + yspd, obj_cloud3)) {
    y += yspd;
} else {
    yspd = 0;
}
// Gliding logic - only triggers when falling
if (!onGround && yspd > 0.5 && canGlide && fireGauge < fireGaugeMax) {
    isGliding = true;
} else {
    isGliding = false;
}
/*
// Start Dodge
if (dodgeKey && !isDodging && moveDir != 0 && onGround) {
    isDodging = true;
    dodgeTimer = dodgeTime;
}

// Apply Dodge
if (isDodging) {
    xspd = moveDir * dodgeSpeed;
    dodgeTimer -= 1;
    sprite_index = flyingSpr;

    if (dodgeTimer <= 0) {
        isDodging = false;
    }
}
*/
// Attack
if (!can_shoot) {
    shoot_timer--;
    if (shoot_timer <= 0) {
        can_shoot = true;
    }
}
if (attackKey && can_shoot) {
	isGliding = false; 
    var arrow = instance_create_layer(x, y, "Instances", obj_player_attack);
    var angle = point_direction(x, y, mouse_x, mouse_y);
    arrow.direction = angle;
    arrow.image_angle = angle;
    arrow.speed = 10;
    sprite_index = spr_player_transition_attack;
    can_shoot = false;
    shoot_timer = shoot_cooldown;
}

// Fire Gauge Logic
if (!onGround && canGlide && yspd > 0) {
    fireGauge += fireGaugeTickSpeed;
    if (fireGauge > fireGaugeMax) {
        fireGauge = fireGaugeMax;
    }
} else {
    fireGauge -= fireGaugeCooldownRate;
    if (fireGauge < 0) {
        fireGauge = 0;
    }
}

// Burn Effect When Overheated
if (fireGauge >= fireGaugeMax) {
    canGlide = false;
    fireDamageTimer++;
    if (fireDamageTimer >= fireDamageCooldown) {
        hp -= 2;
        fireDamageTimer = 0;
    }
} else {
    canGlide = true;
    fireDamageTimer = 0;
}

// Optional death on gauge empty
if (fireGauge == 0) {
    instance_destroy();
}


// Sprite Handling
if (isDodging) {
    sprite_index = flyingSpr;
}
else if (isGliding) {
    sprite_index = glideSpr;
}
else if (onGround) {
    sprite_index = (abs(xspd) > 0) ? walkSpr : idleSpr;
}

// Fix sticking to slope/platform
if (yspd > 0) {
    if (place_meeting(x, y + 1, obj_cloud3)) {
        if (!place_meeting(x, y, obj_cloud3)) {
            y += 1;
        }
    }
}