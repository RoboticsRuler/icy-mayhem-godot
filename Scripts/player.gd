extends RigidBody2D

var jump_velocity = -600
var is_on_ground

@onready var ground_detector = $"Ground Detector"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Jump
	if Input.is_action_just_pressed("space_bar") and is_on_ground:
		apply_central_impulse(Vector2(0, jump_velocity))

	# Rotate
	var rotation_dir = Input.get_action_strength("left") - Input.get_action_strength("right")

	# Detect if player is and isn't on ground
	if ground_detector.is_colliding():
		is_on_ground = true
	else:
		is_on_ground = false

	if rotation_degrees >= 45 and rotation_degrees <= 90:
		mass += 0.5 * delta
	elif not rotation_degrees >= 45 and rotation_degrees <= 90:
		mass = 1

func _on_wall_colliders_area_entered(_area: Area2D) -> void:
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func _on_hit_collider_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		area.queue_free()
		linear_velocity += Vector2(50, 0)
