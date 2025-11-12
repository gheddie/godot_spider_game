class_name SpinningWheel

extends Node3D

@onready var player: AnimationPlayer = $AnimationPlayer

const SPIN_ROTATION = "SpinRotation"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func roll_forward() -> void:
	if player.is_playing():
		player.stop()
	player.play("SpinRotation")

func roll_backward() -> void:
	if player.is_playing():
		player.stop()
	player.play_backwards(SPIN_ROTATION)
