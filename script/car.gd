class_name SimpleCar

extends RigidBody3D

@export var speed := 3.0

@onready var wheel1: SpinningWheel = $Wheel1
@onready var wheel2: SpinningWheel = $Wheel2
@onready var wheel3: SpinningWheel = $Wheel3
@onready var wheel4: SpinningWheel = $Wheel4
@onready var wheel5: SpinningWheel = $Wheel5
@onready var wheel6: SpinningWheel = $Wheel6

const WHEEL_1 = "WHEEL_1"
const WHEEL_2 = "WHEEL_2"
const WHEEL_3 = "WHEEL_3"
const WHEEL_4 = "WHEEL_4"
const WHEEL_5 = "WHEEL_5"
const WHEEL_6 = "WHEEL_6"

var body_rotation: float

const MAX_SPEED: float = 10.0

var wheels: Dictionary = {}

const ROTATION_DIFF = 0.05

func _ready() -> void:
	
	wheels.set(WHEEL_1, wheel1)
	wheels.set(WHEEL_2, wheel2)
	wheels.set(WHEEL_3, wheel3)
	wheels.set(WHEEL_4, wheel4)
	wheels.set(WHEEL_5, wheel5)
	wheels.set(WHEEL_6, wheel6)	
	
	gravity_scale = 2.0		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# print(gravity_scale)
	pass

func _physics_process(delta: float) -> void:
	
	var velocity := Vector3.ZERO
	
	var direction := Input.get_vector("ui_left", "ui_right", "", "")

	if Input.is_action_pressed('ui_up'):
		velocity.x -= clamp(speed, 0.0, MAX_SPEED)
	if Input.is_action_pressed('ui_down'):
		velocity.x += clamp(speed, 0.0, MAX_SPEED)
	if Input.is_action_pressed('ui_right'):
		# apply_torque(Vector3(direction.x,direction.y,0.0))
		body_rotation -= ROTATION_DIFF
	if Input.is_action_pressed('ui_left'):
		# apply_torque(Vector3(direction.x,direction.y,0.0))
		body_rotation += ROTATION_DIFF
		
	rotation.y = body_rotation
		
	apply_impulse(velocity.rotated(Vector3.UP, rotation.y), Vector3.ZERO)
	apply_torque(velocity.rotated(Vector3.UP, rotation.x))
	
	turnWheels()
	
	# Add the gravity.
	# if not is_on_floor():
	# velocity += get_gravity() * delta * 1000				
	
func turnWheels() -> void:
	if Input.is_action_just_pressed('ui_up'):
		print("turn wheels forward...")
		for tmp_wheel:SpinningWheel in wheels.values():
			print("wheel")
			tmp_wheel.roll_forward()
	if Input.is_action_just_pressed('ui_down'):
		print("turn wheels backward...")
		for tmp_wheel:SpinningWheel in wheels.values():
			print("wheel")
			tmp_wheel.roll_backward()
