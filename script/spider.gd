class_name Spider

extends RemovablePlayer

@onready var spider_animator: AnimationPlayer = $spider/AnimationPlayer

# gui stuff
@onready var buttonRestart: Button = $GridContainer/RestarLevel
@onready var headingIndicator: Label = $GridContainer/HeadingIndicator
@onready var boostIndicator: Label = $GridContainer/BoostIndicator

# audio
@onready var clickAudio: AudioStreamPlayer = $Audio/ClickAudio
@onready var boostAudio: AudioStreamPlayer = $Audio/BoostAudio

# booster
@onready var booster: GPUParticles3D = $Booster

@onready var gravity_factor: GravityFactor = GravityFactor.create()

const SPEED = 1
const ROTATION_DIFF = 0.025

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
	
func _physics_process(delta: float) -> void:
	fall(delta)
		
func fall(delta: float) -> void:	
	# Add the gravity.
	if not is_on_floor():
		gravity_factor.on_falling()
	else:
		apply_crash(gravity_factor.get_factor())
		gravity_factor.reset()
	velocity += get_gravity() * delta * gravity_factor.get_factor()
	
func _process(delta: float) -> void:
	boostIndicator.text = str(gravity_factor.get_factor())
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
	move_spider(delta)
	
func move_spider(delta: float) -> void:
	rotate_player()
	boost(delta, Input.is_action_pressed("thrust"))
	move_and_slide()
	
func boost(delta: float, boosting: bool) -> void:
	
	var d : Vector3 = get_gravity()
	if !boosting:
		stop_firing_booster()
		velocity += get_gravity() * delta * 0.1
	else:
		fire_booster()
		velocity -= get_gravity() * delta * 0.1
		
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

func get_collision_tolerance() -> float:
	return 10.0

func fire_booster() -> void:
	booster.emitting = true
	if boostAudio.playing == false:		
		boostAudio.play()

func stop_firing_booster() -> void:
	booster.emitting = false
	boostAudio.stop()
