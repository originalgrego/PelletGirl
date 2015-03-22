    if (!audio_is_playing(snd_pellet)) {
        audio_play_sound(snd_pellet, 1, false);
    } else {
        playPelletSoundNextChance = true;
    }
