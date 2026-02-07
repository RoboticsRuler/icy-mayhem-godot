extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(_delta: float) -> void:
# Unpause game with escape key
	if Input.is_action_just_pressed("exit"):
		get_tree().paused = false
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
		queue_free()

func _on_resume_pressed() -> void:
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	queue_free()

func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	LevelData.buttons_activated = 0
	LevelData.enemies_killed = 0
	CounterController.update_ui_text()
	queue_free()

func _on_exit_pressed() -> void:
	get_tree().paused = false
	LevelData.buttons_activated = 0
	LevelData.enemies_killed = 0
	CounterController.update_ui_text()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	queue_free()
