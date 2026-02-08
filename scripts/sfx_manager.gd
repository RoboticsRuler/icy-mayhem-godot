extends Node

@onready var sfx_player = $AudioStreamPlayer

func play_sfx(stream: AudioStream):
	var sfx_player = AudioStreamPlayer.new()
	add_child(sfx_player)
	sfx_player.stream = stream
	sfx_player.bus = "SFX"
	sfx_player.play()
	# Automatically delete the node when finished
	sfx_player.finished.connect(sfx_player.queue_free)
