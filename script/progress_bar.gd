extends ProgressBar

@onready var drone: SimpleDrone

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# TODO better way ?!?
	drone = get_parent().get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# position = Vector2(drone.global_position.x, drone.global_position.y)
	value = drone.life_points
	pass
