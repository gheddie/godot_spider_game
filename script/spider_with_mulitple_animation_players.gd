class_name SpiderWithMultipleAnimPlayers

extends CharacterBody3D

@onready var player_orig: AnimationPlayer = $AnimationPlayer
@onready var other_player: AnimationPlayer = $TheOtherAnimationPlayer

@onready var playerStab: AnimationPlayer = AnimationPlayer.new()
@onready var playerWalk: AnimationPlayer = AnimationPlayer.new()

var stab_copy: Animation
var walk_copy: Animation

const STAB_COPY_KEY = "STAB_COPY_KEY"
const WALK_COPY_KEY = "WALK_COPY_KEY"

const STAB_LIB_KEY = "StabLib"
const WALK_LIB_KEY = "WalkLib"

func _ready() -> void:	
	
	print(player_orig.get_animation_library_list())
	print(other_player.get_animation_library_list())

	var orig_lib = player_orig.get_animation_library("")	
	print(orig_lib.get_animation_list())
	
	stab_copy = player_orig.get_animation("StabAction").duplicate(true)
	walk_copy = player_orig.get_animation("FrontLegAnimation").duplicate(true)
	
	# print(stab_copy)
	# print(walk_copy)
	
	playerStab.add_animation_library(STAB_LIB_KEY, orig_lib)
	playerStab.get_animation_library(STAB_LIB_KEY).add_animation(STAB_COPY_KEY, stab_copy)
	# print(playerStab.get_animation_library_list())
	# print(playerStab.get_animation_library("MOO").get_animation_list())
	
	playerWalk.add_animation_library(WALK_LIB_KEY, orig_lib)
	playerWalk.get_animation_library(WALK_LIB_KEY).add_animation(WALK_COPY_KEY, walk_copy)	
	# print(playerWalk.get_animation_library_list())
	# print(playerWalk.get_animation_library("MOO").get_animation_list())
	
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
	# player_orig.play("StabAction")
	print(playerStab.get_animation_library_list())
	print(playerStab.get_animation_library(STAB_LIB_KEY).get_animation_list_size())
	print(playerStab.get_animation_library(STAB_LIB_KEY).get_animation_list())
	playerStab.play(StringName("StabLib/STAB_COPY_KEY"))
	
func walk() -> void:
	print("walk")
	# player2.play("MOO/&STAB_COPY_KEY")
	# player2.play("MOO/&WALK_COPY_KEY")
	# other_player.play("stabbing_spider_anim_lib/FrontLegAnimation")
	print(playerWalk.get_animation_library_list())
	print(playerWalk.get_animation_library(WALK_LIB_KEY).get_animation_list_size())
	print(playerWalk.get_animation_library(WALK_LIB_KEY).get_animation_list())
	playerWalk.play(StringName("WalkLib/WALK_COPY_KEY"))

func _physics_process(delta: float) -> void:
	pass
