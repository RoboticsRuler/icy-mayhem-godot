extends Node2D

@onready var kill_counter = $KillCounter
@onready var button_counter = $ButtonCounter

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
	pass

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_selector.tscn")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/options.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
