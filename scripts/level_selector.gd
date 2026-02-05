extends Node2D

func load_level(level_path: String) -> void:
	LevelData.current_level = level_path
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	get_tree().change_scene_to_file(level_path)

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

# Play level 1
func _on_level_1_pressed() -> void:
	load_level("res://scenes/level_1.tscn")


# Play level 2
func _on_level_2_pressed() -> void:
	load_level("res://scenes/level_2.tscn")


# Play level 3
func _on_level_3_pressed() -> void:
	load_level("res://scenes/level_1.tscn")
