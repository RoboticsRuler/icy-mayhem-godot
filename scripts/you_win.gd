extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func load_level(level_path: String) -> void:
	LevelData.current_level = level_path
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	get_tree().change_scene_to_file(level_path)

func _on_next_pressed() -> void:
	# If there is another level, then go to the next one
	if not LevelData.next_level == "none":
		load_level(str(LevelData.next_level))
		LevelData.buttons_activated = 0
		LevelData.enemies_killed = 0
	# If there is not another level, then go to the main menu
	elif LevelData.next_level == "none":
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		LevelData.buttons_activated = 0
		LevelData.enemies_killed = 0


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
