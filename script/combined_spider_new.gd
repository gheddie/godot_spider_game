class_name CombinedSpiderNew

extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var leg1: AnimationPlayer = $Legs/Leg1/AnimationPlayer
@onready var leg2: AnimationPlayer = $Legs/Leg2/AnimationPlayer
@onready var leg3: AnimationPlayer = $Legs/Leg3/AnimationPlayer
@onready var leg4: AnimationPlayer = $Legs/Leg4/AnimationPlayer

const LEG_1 = "LEG_1"
const LEG_2 = "LEG_2"
const LEG_3 = "LEG_3"
const LEG_4 = "LEG_4"

@onready var spider_animator: CombinedAnimator

func _ready() -> void:
	spider_animator = CombinedAnimator.new()
	spider_animator.put_animation_player(LEG_1, leg1)
	spider_animator.put_animation_player(LEG_2, leg2)
	spider_animator.put_animation_player(LEG_3, leg3)
	spider_animator.put_animation_player(LEG_4, leg4)
	
func _process(delta: float) -> void:
	# spider_animator.on_process()
	pass

func start_walking() -> void:
	spider_animator.start_walking()
	
func stop_walking() -> void:	
	spider_animator.stop_walking()
