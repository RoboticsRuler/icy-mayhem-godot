extends Node2D

func _ready() -> void:
	pass # Replace with function body.

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
