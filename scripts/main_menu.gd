extends Node2D

func _ready() -> void:
	GlobalAudioStreamPlayer.play_music_level()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _process(_delta: float) -> void:
	pass

func _on_play_pressed() -> void:
	SfxManager.play_sfx(preload("res://assets/sounds/ui_click.wav"))
	get_tree().change_scene_to_file("res://scenes/level_selector.tscn")

func _on_options_pressed() -> void:
	SfxManager.play_sfx(preload("res://assets/sounds/ui_click.wav"))
	get_tree().change_scene_to_file("res://scenes/options.tscn")

func _on_quit_pressed() -> void:
	SfxManager.play_sfx(preload("res://assets/sounds/ui_click.wav"))
	get_tree().quit()
