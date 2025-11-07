class_name JumpPlate

extends NavigationPoint

@onready var marker: Node3D = $jumpplate/Marker

@onready var enemy_scene: PackedScene = preload("res://assets/simple_drone.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	StaticPrinter.print("jump plate ready...", self)
	GameSingleton.get_instance().register_navigation_point(self)
	
	# spawn_enemy()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func describe() -> String:
	return "moo"

func spawn_enemy() -> void:
	var tmp = enemy_scene.instantiate()
	add_child(tmp)
