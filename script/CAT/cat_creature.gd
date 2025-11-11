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

const LEG_1: String = "LEG_1"
const LEG_2: String = "LEG_2"
const LEG_3: String = "LEG_3"
const LEG_4: String = "LEG_4"

const WEAPON_1: String = "WEAPON_1"
const WEAPON_2: String = "WEAPON_2"

const SPEED: int = 10

func _ready() -> void:
	
	animator = CombinedAnimator.new(true)
	
	animator.put_animation_player(LEG_1, leg1, WALK_ANIMATION, 0.0, false)
	animator.put_animation_player(LEG_2, leg2, WALK_ANIMATION, 0.2, false)
	animator.put_animation_player(LEG_3, leg3, WALK_ANIMATION, 0.4, false)
	animator.put_animation_player(LEG_4, leg4, WALK_ANIMATION, 0.6, false)
	
	animator.put_animation_player(WEAPON_1, weapon1, STAB_ANIMATION, 2.0, true)
	animator.put_animation_player(WEAPON_2, weapon2, STAB_ANIMATION, 2.0, true)

	animator.start_processing()
	
func _process(delta: float) -> void:
	animator.on_process(delta)
	if Input.is_action_pressed("move_forward"):
		position.z += SPEED * delta
	if Input.is_action_pressed("move_backward"):
		position.z -= SPEED * delta
	if Input.is_action_just_pressed("ui_left"):
		stab_2()
	if Input.is_action_just_pressed("ui_right"):
		stab_1()

func stab_1() -> void:
	print("stabbing 1...")
	animator.play_dedicated(WEAPON_1, 0)	
	
func stab_2() -> void:
	print("stabbing 2...")
	animator.play_dedicated(WEAPON_2, 0)	
