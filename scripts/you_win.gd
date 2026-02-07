extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_level(level_path: String) -> void:
	LevelData.current_level = level_path
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	get_tree().change_scene_to_file(level_path)

func _on_next_pressed() -> void:
	var current_path = get_tree().current_scene.scene_file_path
	
	var current_level_num = current_path.to_int() 
	var next_level_num = current_level_num + 1
	
	var next_level_path = "res://scenes/level_" + str(next_level_num) + ".tscn"
	
	if FileAccess.file_exists(next_level_path):
		load_level(next_level_path)
	else:
		# If no more levels, return to main menu or a win screen
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
