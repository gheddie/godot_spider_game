class_name Rocket

extends CharacterBody3D

@onready var shooter: RayCast3D =$Shooter

const SPEED = 25.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.basis * Vector3(-SPEED,0,0) * delta
	pass

func explode(sender: String) -> void:
	StaticPrinter.print(str("rocket exploding........................", sender), self)
	queue_free()
