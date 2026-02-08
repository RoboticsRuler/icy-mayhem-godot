extends AudioStreamPlayer

const level_music = preload("res://assets/sounds/Icy Mayhem.wav")

func _play_music(music: AudioStream, volume = 8.0):
	if stream == music:
		return

	stream = music
	volume_db = volume
	process_mode = Node.PROCESS_MODE_ALWAYS
	play()

func play_music_level():
	_play_music(level_music)
