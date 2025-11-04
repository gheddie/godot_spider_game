class_name PathFinder

extends Object

const TICK_LIMIT: int = 250

var body: CharacterBody3D

var target_position: Vector3

var actual_tick_value: int = 0

var rng : RandomNumberGenerator

func _init(character_body: CharacterBody3D) -> void:
	body = character_body
	rng = RandomNumberGenerator.new()
	randomize_position()

func tick() -> void:	
	actual_tick_value+=1
	if actual_tick_value == TICK_LIMIT or position_reached():
		print("tick")		
		randomize_position()
		actual_tick_value = 0
		
func position_reached() -> bool:
	return body.global_position == target_position

func randomize_position() -> void:
	var diff_x = rng.randi_range(-25,25)
	var diff_y = rng.randi_range(-25,25)
	target_position = Vector3(target_position.x+diff_x,target_position.y+diff_y,target_position.z)
	print(target_position)
