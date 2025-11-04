class_name SlidingDoor

extends Node3D

const AFFECT_OPEN_DISTINCE = 3.5

var openend: bool = false

@onready var animator: AnimationPlayer = $AnimationPlayer
@export var spider: Spider

@onready var state_indicator: CSGBox3D = $StateIndicator

# open state
@onready var spotRed1: SpotLight3D = $SpotRed1
@onready var spotGreen1: SpotLight3D = $SpotGreen1
@onready var spotRed2: SpotLight3D = $SpotRed2
@onready var spotGreen2: SpotLight3D = $SpotGreen2

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
