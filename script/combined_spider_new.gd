class_name CombinedSpiderNew

extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var leg1: AnimationPlayer = $Legs/Leg1/AnimationPlayer
@onready var leg2: AnimationPlayer = $Legs/Leg2/AnimationPlayer
@onready var leg3: AnimationPlayer = $Legs/Leg3/AnimationPlayer
@onready var leg4: AnimationPlayer = $Legs/Leg4/AnimationPlayer

@onready var spider_animator: CombinedSpiderAnimator

func _ready() -> void:
	spider_animator = CombinedSpiderAnimator.new()
	spider_animator.put_animation_player(CombinedSpiderAnimator.LEG_1, leg1)
	spider_animator.put_animation_player(CombinedSpiderAnimator.LEG_2, leg2)
	spider_animator.put_animation_player(CombinedSpiderAnimator.LEG_3, leg3)
	spider_animator.put_animation_player(CombinedSpiderAnimator.LEG_4, leg4)
	
func _process(delta: float) -> void:
	spider_animator.on_process()

func start_walking() -> void:
	spider_animator.start_walking()
	
func stop_walking() -> void:	
	spider_animator.stop_walking()
