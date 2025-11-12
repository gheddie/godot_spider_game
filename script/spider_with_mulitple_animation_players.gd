class_name SpiderWithMultipleAnimPlayers

extends CharacterBody3D

@onready var player_orig: AnimationPlayer = $AnimationPlayer
@onready var other_player: AnimationPlayer = $TheOtherAnimationPlayer

@onready var player1: AnimationPlayer = AnimationPlayer.new()
@onready var player2: AnimationPlayer = AnimationPlayer.new()

var stab_copy: Animation
var walk_copy: Animation

const STAB_COPY_KEY = "STAB_COPY_KEY"
const WALK_COPY_KEY = "WALK_COPY_KEY"

func _ready() -> void:	
	
	print(player_orig.get_animation_library_list())
	print(other_player.get_animation_library_list())

	var orig_lib = player_orig.get_animation_library("")
	print(orig_lib)
	
	stab_copy = player_orig.get_animation("StabAction").duplicate(true)
	walk_copy = player_orig.get_animation("FrontLegAnimation").duplicate(true)
	
	print(stab_copy)
	print(walk_copy)
	
	player1.add_animation_library("MOO", AnimationLibrary.new())
	player1.get_animation_library("MOO").add_animation(STAB_COPY_KEY, stab_copy)
	print(player1.get_animation_library_list())
	print(player1.get_animation_library("MOO").get_animation_list())
	
	player2.add_animation_library("MOO", AnimationLibrary.new())
	player2.get_animation_library("MOO").add_animation(WALK_COPY_KEY, walk_copy)	
	print(player2.get_animation_library_list())
	print(player2.get_animation_library("MOO").get_animation_list())
	
	pass
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		stab()
	if Input.is_action_just_pressed("ui_down"):
		walk()
		
func stab() -> void:
	print("stab")
	# player1.play("MOO/&STAB_COPY_KEY")
	# player1.play("MOO/&WALK_COPY_KEY")
	player_orig.play("StabAction")
	
func walk() -> void:
	print("walk")
	# player2.play("MOO/&STAB_COPY_KEY")
	# player2.play("MOO/&WALK_COPY_KEY")
	other_player.play("stabbing_spider_anim_lib/FrontLegAnimation")

func _physics_process(delta: float) -> void:
	pass
