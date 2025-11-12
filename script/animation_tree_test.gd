class_name SpiderWithAnimationTree

extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var stabbing: bool = false

@onready var tree: AnimationTree = $AnimationTree

func _physics_process(delta: float) -> void:
	pass
	
func _ready() -> void:
	# tree.set("parameters/OneShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	# tree.set("parameters/OneShot/active", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	pass
	
func _process(delta: float) -> void:
	pass
