extends RigidBody2D

var jump_velocity = -600
var buttons_pressed: int = 0
var enemies_killed = 0
var is_on_ground
var can_finish_lvl = false
var interactable: Area2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("dive") and not is_on_ground:
		linear_velocity.y += 10

	# Kill enemy
	if not interactable == null and Input.is_action_just_pressed("interact") and interactable.is_in_group("Enemy"):
		interactable.queue_free()
		enemies_killed += 1

	# Interact with button
	if not interactable == null and Input.is_action_just_pressed("interact") and interactable.is_in_group("Button"):
		interactable.queue_free()
		buttons_pressed += 1

	# Get player's rotation input
	var rotation_dir = Input.get_axis("left", "right")

	# Rotate sled when player is in air and gives input
	if not is_on_ground and rotation_dir:
		angular_velocity += rotation_dir * delta * 3.5
	elif is_on_ground:
		pass

	# Detect ground collision with GroundDetector1
	if $GroundDetector1.is_colliding():
		is_on_ground = true
	elif not $GroundDetector2.is_colliding():
		is_on_ground = false

	# Detect ground collision with GroundDetector2
	if $GroundDetector2.is_colliding():
		is_on_ground = true
	elif not $GroundDetector1.is_colliding():
		is_on_ground = false

	if buttons_pressed == 3:
		can_finish_lvl = true
	elif not buttons_pressed == 3:
		can_finish_lvl = false

# Detect if player lands on their head
func _on_head_detection_area_entered(area: Area2D) -> void:
# Player dies if they land on their head
	if area.is_in_group("Ice"):
		get_tree().call_deferred("change_scene_to_file", "res://scenes/game_over.tscn")

# Detect if player is not on ground
func _on_ground_detection_area_exited(area: Area2D) -> void:
	if area.is_in_group("Ice"):
		is_on_ground = false

# Interaction entrance detection
func _on_interact_detection_area_entered(area: Area2D) -> void:
	interactable = area

	# If player enters a tutorial trigger, slow down time
	if area.is_in_group("Tutorial Trigger"):
		Engine.time_scale = 0.1

	# Enter safehouse if player is able to
	if area.is_in_group("Safehouse") and can_finish_lvl:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

# Interaction exiting detection
func _on_interact_detection_area_exited(area: Area2D) -> void:
	interactable = null

	# If player leaves a tutorial trigger, reset time speed
	if area.is_in_group("Tutorial Trigger"):
		Engine.time_scale = 1
