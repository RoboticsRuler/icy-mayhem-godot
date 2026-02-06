extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func activate():
	$Sprite2D.texture = preload("res://assets/art/button_pressed.png")
