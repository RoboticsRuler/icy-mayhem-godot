extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Snow/GPUParticles2D.emitting = true
	$Snow/GPUParticles2D2.emitting = true
	$Snow/GPUParticles2D3.emitting = true
	$Snow/GPUParticles2D4.emitting = true
	$Snow/GPUParticles2D5.emitting = true
	$Snow/GPUParticles2D6.emitting = true
	$Snow/GPUParticles2D7.emitting = true
	$Snow/GPUParticles2D8.emitting = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
