extends CharacterBody3D

@onready var shooter: RayCast3D =$Shooter

const SPEED = 40.0
# const SPEED = 10.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.basis * Vector3(-SPEED,0,0) * delta
	pass
