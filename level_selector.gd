extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


# Play level 1
func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	LevelData.current_level = ("res://scenes/level_1.tscn")


# Play level 2
func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	LevelData.current_level = ("res://scenes/level_2.tscn")


# Play level 3
func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	LevelData.current_level = ("res://scenes/level_3.tscn")
