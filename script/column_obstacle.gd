class_name ColumnObstacle

extends StaticBody3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func on_body_entered(body: Node3D) -> void:
	if body is Rocket:
		body.explode(get_obstacle_description())

func get_obstacle_description() -> String:
	return "ColumnObstacle"
