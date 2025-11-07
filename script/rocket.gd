class_name Rocket

extends CharacterBody3D

@onready var shooter: RayCast3D = $Shooter

const SPEED = 25.0

const SELF_DESCTRUCT_DISTANCE = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.basis * Vector3(-SPEED,0,0) * delta
	check_self_destruct()
	pass
	
func check_self_destruct() -> void:
	var distance = global_position.distance_to(GameSingleton.get_instance().spider.global_position)
	if (distance >= SELF_DESCTRUCT_DISTANCE):
		explode("SELF_DESCTRUCT_DISTANCE")
	pass

func explode(sender: String) -> void:
	StaticPrinter.print(str("rocket exploding........................", sender), self)
	queue_free()
