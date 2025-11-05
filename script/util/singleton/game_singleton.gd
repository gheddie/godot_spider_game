class_name GameSingleton

extends Node

static var instance: GameSingleton = GameSingleton.new()

var enemies = []

var navigation_points = []

var spider: Spider

var rng: RandomNumberGenerator = RandomNumberGenerator.new()

static func get_instance() -> GameSingleton:
	instance.rng = RandomNumberGenerator.new()
	# instance.init_spawn_timer()
	return instance

func register_player(player: RemovablePlayer) -> void:
	StaticPrinter.print("registered player...", self)
	
func register_navigation_point(point: JumpPlate) -> void:
	StaticPrinter.print("registered navigation point...", self)
	StaticPrinter.print(point.describe(), self)
	navigation_points.insert(0, point)

func on_spawn_timout() -> void:
	StaticPrinter.print("on_spawn_timout", self)	
	
func spawn_enemy() -> void:
	StaticPrinter.print("spawning...", self)
	var nav_point : JumpPlate = get_random_navigation_point()
	nav_point.spawn_enemy()		

func get_random_navigation_point() -> JumpPlate:
	if navigation_points.is_empty():
		return null
	var index = rng.randi_range(0, navigation_points.size()-1)
	return navigation_points.get(index)
