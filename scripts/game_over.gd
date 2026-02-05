extends Node2D

func _ready() -> void:
	pass

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file(LevelData.current_level)

func _on_quit_pressed() -> void:
	get_tree().quit()
