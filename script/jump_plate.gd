class_name JumpPlate

extends NavigationPoint

@onready var marker: Node3D = $jumpplate/Marker

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	StaticPrinter.print("jump plate ready...", self)
	GameSingleton.get_instance().register_navigation_point(self)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func describe() -> String:
	return "moo"
