@abstract
class_name RemovablePlayer

extends CharacterBody3D

func die() -> void:
	queue_free()

func apply_crash(crash_force: float) -> void:
	# print(CustomLogger.new().string("landed with force:").float(crash_force).log())
	if crash_force >= get_collision_tolerance():
		die()

@abstract func get_collision_tolerance() -> float
