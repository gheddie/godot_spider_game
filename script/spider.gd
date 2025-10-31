extends RigidBody3D

@onready var spider_animator: AnimationPlayer = $spider/AnimationPlayer

@onready var buttonStartWalking: Button = $GridContainer/StartWalking
@onready var buttonStopWalking: Button = $GridContainer/StopWalking

const WALK_ANIMATION: String = "Animation"

func _ready() -> void:	
	print("spider is ready...")
	print(spider_animator)	
	connect_buttons()	
	var anim : Animation = spider_animator.get_animation(WALK_ANIMATION)
	# make walk animation run forever...
	anim.loop_mode = (Animation.LOOP_LINEAR)
	
func _process(delta: float) -> void:
	pass

func connect_buttons() -> void:
	buttonStartWalking.pressed.connect(start_walking)
	buttonStopWalking.pressed.connect(stop_walking)

func start_walking():
	spider_animator.play(WALK_ANIMATION)
	
func stop_walking():
	spider_animator.stop()
