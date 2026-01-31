extends RigidBody2D

var jump_velocity = -600
var stability: int = 100
var is_on_ground

@onready var ground_detector = $"Ground Detector"
@onready var stability_bar = $"Camera/Stability Bar"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_ground:
		apply_central_impulse(Vector2(0, jump_velocity))
		stability -= 40

	# Detect if player is and isn't on ground
	if ground_detector.is_colliding():
		is_on_ground = true
	else:
		is_on_ground = false

	# Lose and regain stability
	if abs(linear_velocity.x) > 850 and is_on_ground:
		stability -= 3
	elif abs(linear_velocity.x) < 850 and is_on_ground:
		stability += 2

	# Quit the game if player has no stability
	if stability == 0:
		get_tree().quit()

	# Clamp stability to not go over limits
	stability = clamp(stability, 0, 100)

	# Update stability bar based on player's stability
	stability_bar.value = stability
