extends RigidBody3D

@onready var spider_animator: AnimationPlayer = $spider/AnimationPlayer

@onready var buttonRearLegAnimation: Button = $GridContainer/PlayRearLegAnimation
@onready var buttonLeftLegAnimation: Button = $GridContainer/PlayLeftLegAnimation
@onready var buttonRightLegAnimation: Button = $GridContainer/PlayRightLegAnimation
@onready var buttonFrontLegAnimation: Button = $GridContainer/PlayFrontLegAnimation

@onready var buttonStartWalking: Button = $GridContainer/StartWalking
@onready var buttonStopWalking: Button = $GridContainer/StopWalking

const LEFT_LEG_ANIM: String = "LeftLegAnimation"
const RIGHT_LEG_ANIM: String = "RightLegAnimation"
const FRONT_LEG_ANIM: String = "FrontLegAnimation"
const REAR_LEG_ANIM: String = "RearLegAnimation"

var frontLegAnimation : Animation
var rearLegAnimation : Animation
var leftLegAnimation : Animation
var rigthLegAnimation : Animation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	print("spider is ready...")
	print(spider_animator)	
	connect_buttons()	
	
	init_animations()
	
func init_animations() -> void:
	
	frontLegAnimation = spider_animator.get_animation(FRONT_LEG_ANIM)
	rearLegAnimation = spider_animator.get_animation(REAR_LEG_ANIM)
	leftLegAnimation = spider_animator.get_animation(LEFT_LEG_ANIM)
	rigthLegAnimation = spider_animator.get_animation(RIGHT_LEG_ANIM)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func connect_buttons() -> void:
	
	print("connect_buttons...")
	
	buttonRearLegAnimation.pressed.connect(play_animation.bind(REAR_LEG_ANIM))
	buttonFrontLegAnimation.pressed.connect(play_animation.bind(FRONT_LEG_ANIM))
	buttonLeftLegAnimation.pressed.connect(play_animation.bind(LEFT_LEG_ANIM))
	buttonRightLegAnimation.pressed.connect(play_animation.bind(RIGHT_LEG_ANIM))
	
	buttonStartWalking.pressed.connect(start_walking)
	buttonStopWalking.pressed.connect(stop_walking)

func play_animation(animation_name: String):
	
	print("play_animation...")
	print(animation_name)
	
	spider_animator.play(animation_name)
	
	pass

func start_walking():
	
	print("start_walking...")
	
	play_animation(FRONT_LEG_ANIM)
	play_animation(REAR_LEG_ANIM)
	play_animation(LEFT_LEG_ANIM)
	play_animation(RIGHT_LEG_ANIM)
	
	pass
	
func stop_walking():
	
	print("stop_walking...")
	pass
