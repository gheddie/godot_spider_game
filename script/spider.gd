extends RigidBody3D

@onready var spider_animator: AnimationPlayer = $spider/AnimationPlayer

@onready var buttonStartWalking: Button = $GridContainer/StartWalking
@onready var buttonStopWalking: Button = $GridContainer/StopWalking

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	print("spider is ready...")
	print(spider_animator)	
	connect_buttons()	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func connect_buttons() -> void:
	
	print("connect_buttons...")
	
	buttonStartWalking.pressed.connect(start_walking)
	buttonStopWalking.pressed.connect(stop_walking)

func play_animation(animation_name: String):
	
	print("play_animation...")
	print(animation_name)
	
	spider_animator.play(animation_name)
	
	pass

func start_walking():
	
	print("start_walking...")
	play_animation("Animation")
	
func stop_walking():
	
	print("stop_walking...")
	pass
