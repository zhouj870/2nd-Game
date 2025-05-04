//win screen automatically
if (keyboard_check(vk_control) && keyboard_check(ord("P"))) {
    room_goto(win_screen);
	audio_stop_all();
}

//full health
if (keyboard_check(vk_control) && keyboard_check(ord("H")))
{
	hp = max_hp;
}

