class_name Spider

extends CharacterBody3D

@onready var spider_animator: AnimationPlayer = $spider/AnimationPlayer

@onready var buttonRestart: Button = $GridContainer/RestarLevel

const SPEED = 2.5

const WALK_ANIMATION: String = "Animation"

func _ready() -> void:	
	print("spider is ready...")
	print(spider_animator)	
	connect_buttons()	
	var anim : Animation = spider_animator.get_animation(WALK_ANIMATION)
	# make walk animation run forever...
	anim.loop_mode = (Animation.LOOP_LINEAR)
	
func _process(delta: float) -> void:
	
	if (Input.is_action_pressed("move_forward") or Input.is_action_pressed("move_backward")):
		start_walking()
	else:
		stop_walking()
	
	var input_dir := Input.get_vector("move_forward", "move_backward", "", "")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func connect_buttons() -> void:
	buttonRestart.pressed.connect(restart_level)

func start_walking():
	spider_animator.play(WALK_ANIMATION)
	
func stop_walking():
	spider_animator.stop()
	
func restart_level():
	print("restart_level")
