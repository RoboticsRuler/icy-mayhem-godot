extends CanvasLayer

@onready var kill_counter = $KillCounter
@onready var button_counter = $ButtonCounter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# If kill count doesn't equal zero, then display the current count
	if not LevelData.enemies_killed == 0:
		kill_counter.text = "Kills: " + str(LevelData.enemies_killed)
	# If kill count equals zero, then show 0 instead of a null value
	elif LevelData.enemies_killed == 0:
		kill_counter.text = "Kills: 0"

	if not LevelData.buttons_activated == 0:
		button_counter.text = "Buttons: " + str(LevelData.buttons_activated)
	# If button count equals zero, then show 0 instead of a null value
	elif LevelData.buttons_activated == 0:
		button_counter.text = "Buttons: 0"

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
	queue_free()

func _on_exit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	queue_free()
