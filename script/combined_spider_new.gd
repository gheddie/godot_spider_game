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

const WALK_ANIMATION: String = "LegAnimation"

@onready var spider_animator: CombinedAnimator

func _ready() -> void:
	spider_animator = CombinedAnimator.new(true)
	spider_animator.put_animation_player(LEG_1, leg1, WALK_ANIMATION, 0.0)
	spider_animator.put_animation_player(LEG_2, leg2, WALK_ANIMATION, 0.1)
	spider_animator.put_animation_player(LEG_3, leg3, WALK_ANIMATION, 0.2)
	spider_animator.put_animation_player(LEG_4, leg4, WALK_ANIMATION, 0.3)
	
func _process(delta: float) -> void:
	spider_animator.on_process(delta)

func start_walking() -> void:
	spider_animator.start_processing()
	
func stop_walking() -> void:	
	spider_animator.stop_processing()
	
func stop_single_leg() -> void:
	spider_animator.stop_animating(LEG_4)

func move_single_leg() -> void:
	spider_animator.play_once(LEG_4)
