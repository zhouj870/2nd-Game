var rightKey = keyboard_check(vk_right);
var leftKey = keyboard_check(vk_left);
var jumpKey = keyboard_check_pressed(vk_up);
var downKey = keyboard_check(vk_down);

//x movement 
moveDir = rightKey - leftKey;

if moveDir != 0 {face = moveDir;};


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

if abs(xspd) > 0 {sprite_index = walkSpr};

if yspd && xspd == 0 {sprite_index = idleSpr};


