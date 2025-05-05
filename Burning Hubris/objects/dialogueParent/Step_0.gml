
if (showing_dialogue == false) {
	if (dialogue.count() <= 0) {
		instance_destroy();
		return;
		}

	current_dialogue = dialogue.pop();
	showing_dialogue = true;
} else {
	if (keyboard_check_released(vk_space))
		showing_dialogue = false;
}
