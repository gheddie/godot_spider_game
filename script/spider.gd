class_name Spider

extends CharacterBody3D

@onready var spider_animator: AnimationPlayer = $spider/AnimationPlayer

# gui stuff
@onready var buttonRestart: Button = $GridContainer/RestarLevel
@onready var headingIndicator: Label = $GridContainer/HeadingIndicator

# audio
@onready var clickAudio: AudioStreamPlayer = $ClickAudio

const SPEED = 1
const ROTATION_DIFF = 0.025

const FALL_GRAVITY = 0.5

const WALK_ANIMATION: String = "Animation"

var body_rotation: float

func _ready() -> void:	
	print("spider is ready...")
	print(spider_animator)	
	connect_buttons()	
	var anim : Animation = spider_animator.get_animation(WALK_ANIMATION)
	# make walk animation run forever...
	anim.loop_mode = (Animation.LOOP_LINEAR)
	
	click()
	
	print(get_gravity())
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * FALL_GRAVITY	
	
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
		
	rotate_player()
	
	apply_gravity()

	move_and_slide()
	
func apply_gravity() -> void:
	
	pass
	
func rotate_player() -> void:
	
	if (Input.is_action_pressed("turn_left")):
		body_rotation += ROTATION_DIFF
		headingIndicator.text = str(rad_to_deg(body_rotation))
		
	if (Input.is_action_pressed("turn_right")):
		body_rotation -= ROTATION_DIFF
		headingIndicator.text = str(rad_to_deg(body_rotation))
		
	rotation.y = body_rotation

func connect_buttons() -> void:
	buttonRestart.pressed.connect(restart_level)

func start_walking():
	spider_animator.play(WALK_ANIMATION)
	
func stop_walking():
	spider_animator.stop()
	
func restart_level():
	print("restart_level")
	
func click() -> void:
	clickAudio.play()
