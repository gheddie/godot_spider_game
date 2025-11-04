class_name SlidingDoor

extends Node3D

const AFFECT_OPEN_DISTINCE = 1.5

var openend: bool = false

@onready var animator: AnimationPlayer = $AnimationPlayer
@export var spider: Spider

@onready var state_indicator: CSGBox3D = $StateIndicator

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if (distance_to_enemy() < AFFECT_OPEN_DISTINCE):
		open()
	else:
		close()

func open() -> void:
	if !openend:
		animator.play("open")	
		
func close() -> void:
	if openend:
		print("door closed...")
		animator.play_backwards("open")
	openend = false

func distance_to_enemy() -> float:
	var distance = global_position.distance_to(spider.global_position)
	return distance

func on_opened() -> void:
	print("door opened...")
	openend = true

func on_closed() -> void:
	print("door closed...")
