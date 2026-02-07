extends Node

var buttons_activated = 0
var enemies_killed = 0
var current_level: String
var next_level: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	buttons_activated = clampi(buttons_activated, 0, 9)
