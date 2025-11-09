class_name CatCreature

extends CharacterBody3D

@onready var leg1: AnimationPlayer = $Leg1/CatLeg/AnimationPlayer
@onready var leg2: AnimationPlayer = $Leg2/CatLeg/AnimationPlayer
@onready var leg3: AnimationPlayer = $Leg3/CatLeg/AnimationPlayer
@onready var leg4: AnimationPlayer = $Leg4/CatLeg/AnimationPlayer

@onready var weapon1: AnimationPlayer = $Weapon1/CatWeapon/AnimationPlayer
@onready var weapon2: AnimationPlayer = $Weapon2/CatWeapon/AnimationPlayer

@onready var animator: CombinedAnimator

const WALK_ANIMATION: String = "RunLeg"
const STAB_ANIMATION: String = "PushWeapon"

func _ready() -> void:
	
	animator = CombinedAnimator.new(true)
	
	animator.put_animation_player("LEG_1", leg1, WALK_ANIMATION, 0.0)
	animator.put_animation_player("LEG_2", leg2, WALK_ANIMATION, 0.1)
	animator.put_animation_player("LEG_3", leg3, WALK_ANIMATION, 0.2)
	animator.put_animation_player("LEG_4", leg4, WALK_ANIMATION, 0.3)
	animator.put_animation_player("WEAPON_1", weapon1, STAB_ANIMATION, 5.0)
	animator.put_animation_player("WEAPON_2", weapon2, STAB_ANIMATION, 5.0)

	animator.start_processing()
	
func _process(delta: float) -> void:
	animator.on_process(delta)
	if Input.is_action_just_pressed("ui_up"):
		position.x += 1
	if Input.is_action_pressed("ui_down"):
		rotation.x += 1
