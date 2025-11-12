class_name Spider

extends RemovablePlayer

@onready var spider_animator: AnimationPlayer = $spider/AnimationPlayer

# audio
@onready var clickAudio: AudioStreamPlayer = $Audio/ClickAudio
@onready var boostAudio: AudioStreamPlayer = $Audio/BoostAudio
@onready var fireGunAudio: AudioStreamPlayer = $Audio/FireGunAudio

# booster
@onready var booster: GPUParticles3D = $Booster

@onready var gravity_factor: GravityFactor = GravityFactor.create()

# spots
@onready var spot1: SpotLight3D = $spider/Camera3D/ForwardSpot1
@onready var spot2: SpotLight3D = $spider/Camera3D/ForwardSpot2

var targeted_object: Object
	
const SPEED = 2
const ROTATION_DIFF = 0.05

const WALK_ANIMATION: String = "Animation"

const SPOT_ENERGY: float = 100.0

var body_rotation: float

# raycast to shoot
@onready var shootingRaycast: RayCast3D = $ShootingRaycast

@onready var rocket_scene: PackedScene = preload("res://assets/rocket.tscn")

@onready var rocket_spawner: MeshInstance3D = $spider/RocketSpawner

func _ready() -> void:	
	
	print("spider is ready...")	
	
	GameSingleton.instance.spider = self
	
	print(spider_animator)	
	var anim : Animation = spider_animator.get_animation(WALK_ANIMATION)
	# make walk animation run forever...
	anim.loop_mode = (Animation.LOOP_LINEAR)
	
	click()
	lights_off()
	
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
	check_targeting()
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
	
	if Input.is_action_just_pressed("fire"):
		fire_weapon()
		
# see https://www.youtube.com/watch?v=6bbPHsB9TtI		
func fire_weapon() -> void:
	StaticPrinter.print("fire_weapon", self)
	var rocket = rocket_scene.instantiate()
	rocket.position = shootingRaycast.global_position	
	rocket.rotation = rotation
	
	get_parent().add_child(rocket)		
	if fireGunAudio.playing == false:		
		fireGunAudio.stop()
		fireGunAudio.play()
	
func check_targeting() -> void:
	var collider = shootingRaycast.get_collider()
	if collider != null:
		if !collider == targeted_object:
			targeted_object = collider
			print(targeted_object)
	
func move_spider(delta: float) -> void:
	rotate_player()
	boost(delta, Input.is_action_pressed("thrust"))
	move_and_slide()
	
func boost(delta: float, boosting: bool) -> void:
	
	if !boosting:
		stop_firing_booster()
		velocity += get_gravity() * delta * 0.1
	else:
		fire_booster()
		velocity -= get_gravity() * delta * 0.1
		
func rotate_player() -> void:
	if (Input.is_action_pressed("turn_left")):
		body_rotation += ROTATION_DIFF
	if (Input.is_action_pressed("turn_right")):
		body_rotation -= ROTATION_DIFF
	rotation.y = body_rotation

func start_walking():
	spider_animator.play(WALK_ANIMATION)
	
func stop_walking():
	spider_animator.stop()
	
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

func lights_on() -> void:
	print("lights_on")
	spot1.light_energy = SPOT_ENERGY
	spot2.light_energy = SPOT_ENERGY
	pass
	
func lights_off() -> void:
	print("lights_off")
	spot1.light_energy = 0.0
	spot2.light_energy = 0.0
	pass

# for testint
func spawn_enemy() -> void:
	GameSingleton.get_instance().spawn_enemy()
