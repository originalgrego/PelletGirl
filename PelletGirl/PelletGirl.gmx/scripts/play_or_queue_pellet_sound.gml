//Method which will play the pellet sound if one is not currently playing, helps keep the
//sound from becoming annoying
    
if (!audio_is_playing(snd_pellet)) {
  audio_play_sound(snd_pellet, 1, false);
} else {
  playPelletSoundNextChance = true;
}