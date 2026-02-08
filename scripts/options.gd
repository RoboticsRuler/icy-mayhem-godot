extends Node2D

func _ready() -> void:
	pass # Replace with function body.
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		SfxManager.play_sfx(preload("res://assets/sounds/ui_click.wav"))
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_back_pressed() -> void:
	SfxManager.play_sfx(preload("res://assets/sounds/ui_click.wav"))
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
