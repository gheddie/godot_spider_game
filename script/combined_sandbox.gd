extends Node3D

@onready var startWalking: Button = $Grid/StartWalking
@onready var spider: CombinedSpiderNew = $CombinedSpider

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_right"):
		spider.start_walking()
	if Input.is_action_just_pressed("ui_left"):
		spider.stop_walking()
	if Input.is_action_just_pressed("ui_up"):
		spider.move_single_leg()
	if Input.is_action_just_pressed("ui_down"):
		spider.stop_single_leg()
