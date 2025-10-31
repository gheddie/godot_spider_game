extends RigidBody3D

@onready var spider_animator: AnimationPlayer = $spider/AnimationPlayer

@onready var buttonRearLegAnimation: Button = $GridContainer/PlayRearLegAnimation
@onready var buttonLeftLegAnimation: Button = $GridContainer/PlayLeftLegAnimation
@onready var buttonRightLegAnimation: Button = $GridContainer/PlayRightLegAnimation
@onready var buttonFrontLegAnimation: Button = $GridContainer/PlayFrontLegAnimation

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
	
	print(buttonRearLegAnimation)
	buttonRearLegAnimation.pressed.connect(play_animation.bind("RearLegAnimation"))
	
	print(buttonFrontLegAnimation)
	buttonFrontLegAnimation.pressed.connect(play_animation.bind("FrontLegAnimation"))
	
	print(buttonLeftLegAnimation)
	buttonLeftLegAnimation.pressed.connect(play_animation.bind("LeftLegAnimation"))
	
	print(buttonRightLegAnimation)
	buttonRightLegAnimation.pressed.connect(play_animation.bind("RightLegAnimation"))

func play_animation(animation_name: String):
	
	print("play_animation...")
	print(animation_name)
	
	spider_animator.play(animation_name)
	
	pass
