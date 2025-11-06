class_name SimpleDrone

extends RemovablePlayer

const SPEED = 1.0

@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D

var spider: Spider

var provoked := false
var aggro_range := 12.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameSingleton.get_instance().register_player(self)
	StaticPrinter.print(navigation_agent.name, self)
	spider = GameSingleton.instance.spider

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	navigation_agent.target_position = spider.global_position

func _physics_process(delta: float) -> void:
	var next_position = navigation_agent.get_next_path_position()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	var direction = global_position.direction_to(next_position)
	
	var distance = global_position.distance_to(spider.global_position)
	if distance <= aggro_range:
		provoked = true
		
	if direction:
		look_at_target(direction)
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	move_and_slide()

func look_at_target(direction: Vector3) -> void:
	var adjusted_direction = direction
	# do not look up or down
	adjusted_direction.y = 0
	look_at(global_position + adjusted_direction, Vector3.UP, true)

func get_collision_tolerance() -> float:
	return 10.0


func on_body_entered(body: Node3D) -> void:
	if body is Rocket:
		body.explode("Rocket ey")
