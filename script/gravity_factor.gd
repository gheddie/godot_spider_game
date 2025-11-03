class_name GravityFactor

extends Object

const INITIAL_FALL_GRAVITY: float = 0.0

const FALL_GRAVITY_DIV: float = 0.001

var gravity_factor: float:
	set(new_gravity):
		gravity_factor = new_gravity

func get_factor() -> float:
	return gravity_factor

static func create() -> GravityFactor:
	var instance = GravityFactor.new()
	instance.gravity_factor = INITIAL_FALL_GRAVITY
	return instance

func on_falling() -> void:
	gravity_factor += FALL_GRAVITY_DIV

func on_boost() -> void:
	gravity_factor -= FALL_GRAVITY_DIV * 5
