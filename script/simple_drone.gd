extends RemovablePlayer

@onready var path_finder: PathFinder = PathFinder.new(self)

const SPEED = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameSingleton.get_instance().register_player(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path_finder.tick()

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(path_finder.target_position)
	if direction:
		look_at_target(direction)
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)		
	var collided: bool = move_and_slide()
	if collided:
		path_finder.randomize_position()

func look_at_target(direction: Vector3) -> void:
	var adjusted_direction = direction
	# do not look up or down
	adjusted_direction.y = 0
	look_at(global_position + adjusted_direction, Vector3.UP, true)

func get_collision_tolerance() -> float:
	return 10.0
