extends RigidBody2D

var is_on_ground
var can_finish_lvl = false
var is_button_pressed
var can_press_button
var interactable: Area2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	# Dive
	if Input.is_action_pressed("dive") and not is_on_ground:
		apply_central_impulse(Vector2(0, 1.8))

	# Exit level
	if Input.is_action_just_pressed("exit"):
		get_tree().paused = true
		var go_scene = load("res://scenes/pause_menu.tscn").instantiate()
		get_tree().root.add_child(go_scene)
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	# Kill enemy
	if not interactable == null and Input.is_action_just_pressed("interact") and interactable.is_in_group("Enemy"):
		interactable.activate()
		LevelData.enemies_killed += 1
		CounterController.update_ui_text()

	# Interact with button
	if not interactable == null and Input.is_action_just_pressed("interact") and interactable.is_in_group("Button") and can_press_button: 
		interactable.activate()
		LevelData.buttons_activated += 1
		CounterController.update_ui_text()
		is_button_pressed = true
		can_press_button = false

	# Get player's rotation input
	var rotation_dir = Input.get_axis("left", "right")

	# Rotate sled when player is in air and gives input
	if not is_on_ground and rotation_dir:
		angular_velocity += rotation_dir * delta * 4
	elif is_on_ground:
		pass

	# Detect ground collision with GroundDetector1
	if $GroundDetector1.is_colliding():
		is_on_ground = true
	elif not $GroundDetector2.is_colliding() and not $GroundDetector3.is_colliding() and not $GroundDetector4.is_colliding():
		is_on_ground = false

	# Detect ground collision with GroundDetector2
	if $GroundDetector2.is_colliding():
		is_on_ground = true
	elif not $GroundDetector1.is_colliding() and not $GroundDetector3.is_colliding() and not $GroundDetector4.is_colliding():
		is_on_ground = false

	# Detect ground collision with GroundDetector3
	if $GroundDetector3.is_colliding():
		is_on_ground = true
	elif not $GroundDetector1.is_colliding() and not $GroundDetector2.is_colliding() and not $GroundDetector4.is_colliding():
		is_on_ground = false

	# Detect ground collision with GroundDetector4
	if $GroundDetector4.is_colliding():
		is_on_ground = true
	elif not $GroundDetector1.is_colliding() and not $GroundDetector2.is_colliding() and not $GroundDetector3.is_colliding():
		is_on_ground = false

	if LevelData.buttons_activated == 3:
		can_finish_lvl = true
	elif not LevelData.buttons_activated == 3:
		can_finish_lvl = false

# Detect if player lands on their head
func _on_death_detection_area_entered(area: Area2D) -> void:
# Player dies if they land on their head
	if area.is_in_group("Ice"):
		get_tree().paused = true
		LevelData.buttons_activated = 0
		LevelData.enemies_killed = 0
		var go_scene = load("res://scenes/game_over.tscn").instantiate()
		get_tree().root.add_child(go_scene)
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

# Interaction entrance detection
func _on_interact_detection_area_entered(area: Area2D) -> void:
	if area == interactable:
		interactable = null
	
	if area.is_in_group("Button") or area.is_in_group("Enemy"):
		interactable = area
		is_button_pressed = false
		can_press_button = true

	# If player enters a tutorial trigger, slow down time
	if area.is_in_group("Tutorial Trigger"):
		Engine.time_scale = 0.1

	if area.is_in_group("Deathzone"):
		get_tree().paused = true
		var go_scene = load("res://scenes/game_over.tscn").instantiate()
		get_tree().root.add_child(go_scene)
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	# Enter safehouse if player is able to
	if area.is_in_group("Safehouse") and can_finish_lvl:
		get_tree().call_deferred("change_scene_to_file", "res://scenes/you_win.tscn")
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif area.is_in_group("Safehouse") and not can_finish_lvl:
		get_tree().paused = true
		var go_scene = load("res://scenes/game_over.tscn").instantiate()
		get_tree().root.add_child(go_scene)
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

# Interaction exiting detection
func _on_interact_detection_area_exited(area: Area2D) -> void:
	if area == interactable:
		interactable = null

	# If player leaves a tutorial trigger, reset time speed
	if area.is_in_group("Tutorial Trigger"):
		Engine.time_scale = 1

	if area.is_in_group("Button") and is_button_pressed == false:
		get_tree().paused = true
		var go_scene = load("res://scenes/game_over.tscn").instantiate()
		get_tree().root.add_child(go_scene)
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
