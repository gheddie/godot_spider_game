extends Node3D

@onready var startWalking: Button = $Grid/StartWalking
@onready var spider: CombinedSpiderNew = $CombinedSpider

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_right"):
		walk_spider()
	if Input.is_action_just_pressed("ui_left"):
		stop_spider()

func walk_spider():
	spider.start_walking()

func stop_spider():
	spider.stop_walking()
