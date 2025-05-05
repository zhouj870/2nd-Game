if (keyboard_check_pressed(ord("R"))) {
	room_restart();
}

if (keyboard_check_pressed(ord("G"))) {
	game_restart();
}


if (keyboard_check_pressed(ord("1"))) {
	show_debug_message("Going to room one");
	room_goto(level_one);
}


if (keyboard_check_pressed(ord("2"))) {
	show_debug_message("Going to Room Two");
	room_goto(level_two);
}

if (keyboard_check_pressed(ord("3"))) {
	show_debug_message("Going to boss room")
	room_goto(boss_room);
}


if (keyboard_check_pressed(ord("4"))) {
	show_debug_message("Going to tutorial room")
	room_goto(tutorial_room);
}

