class_name GameSingleton

extends Node

static var instance: GameSingleton = GameSingleton.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

static func get_instance() -> GameSingleton:
	return instance

func register_player(player: RemovablePlayer) -> void:
	StaticPrinter.print("registered player...", self)
	
func register_navigation_point(point: JumpPlate) -> void:
	StaticPrinter.print("registered navigation point...", self)
	StaticPrinter.print(point.describe(), self)
