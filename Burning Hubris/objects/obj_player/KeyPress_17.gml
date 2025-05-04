//win screen automatically
if (keyboard_check(ord("P")) && keyboard_check(vk_control)) {
    room_goto(win_screen);
}

//full health
if (keyboard_check(ord("H")) && keyboard_check(vk_control))
{
	hp = max_hp;
}

