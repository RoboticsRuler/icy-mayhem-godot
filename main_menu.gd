extends Node2D

@onready var kill_counter = $KillCounter

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	# If kill count doesn't equal zero, then display the current count
	if not LevelData.enemies_killed == 0:
		kill_counter.text = "Kills: " + str(LevelData.enemies_killed)
	# If kill count equals zero, then show 0 instead of a null value
	elif LevelData.enemies_killed == 0:
		kill_counter.text = "Kills: 0"

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_selector.tscn")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/options.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
