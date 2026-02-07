extends CanvasLayer

func _ready() -> void:
	pass

func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	queue_free()
	LevelData.buttons_activated -= 3
	
func _on_exit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	queue_free()
