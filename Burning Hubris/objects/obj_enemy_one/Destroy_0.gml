with (obj_player) {
    fireGauge -= 20;
    if (fireGauge < 0) fireGauge = 0;
}
audio_play_sound(snd_enemy1, 3,false);
