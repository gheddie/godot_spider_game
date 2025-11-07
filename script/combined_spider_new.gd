class_name CombinedSpiderNew

extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var leg1: AnimationPlayer = $Legs/Leg1/AnimationPlayer
@onready var leg2: AnimationPlayer = $Legs/Leg2/AnimationPlayer
@onready var leg3: AnimationPlayer = $Legs/Leg3/AnimationPlayer
@onready var leg4: AnimationPlayer = $Legs/Leg4/AnimationPlayer

const WALK_ANIMATION: String = "LegAnimation"

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func start_walking() -> void:
	print("walk spider AAA...")
	leg1.play(WALK_ANIMATION)
	leg2.play(WALK_ANIMATION)
	leg3.play(WALK_ANIMATION)
	leg4.play(WALK_ANIMATION)
	pass
	
func stop_walking() -> void:
	print("stop spider AAA...")
	leg1.stop()
	leg2.stop()
	leg3.stop()
	leg4.stop()
	pass
