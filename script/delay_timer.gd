class_name DelayTimer

extends Object

var delay: float

var elapsed: bool = false

var applied_duration: float = 0.0

func _init(aDelay: float) -> void:
	delay = aDelay

func apply_duration(duration: float) -> void:
	applied_duration += duration
	if applied_duration >= delay:
		elapsed = true

func has_elapsed() -> bool:
	return elapsed
	
func reset() -> void:
	applied_duration = 0.0
	elapsed = false
