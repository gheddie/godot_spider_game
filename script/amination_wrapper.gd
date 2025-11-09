class_name AnimationWrapper

extends Object

var player: AnimationPlayer

var identifier: String

var animation_name: String

var delay_timer: DelayTimer

var processing : bool = true

func _init(aPlayer:AnimationPlayer, aIdentifier:String, aName:String, aStartDelay: float) -> void:
	player = aPlayer
	identifier = aIdentifier
	animation_name = aName
	delay_timer = DelayTimer.new(aStartDelay)
	
func play(delta: float) -> void:
	delay_timer.apply_duration(delta)
	if delay_timer.has_elapsed() and processing:
		player.play(animation_name)

func stop() -> void:
	processing = false

func is_playing() -> bool:
	return player.is_playing()

func reset_start_delay() -> void:
	delay_timer.reset()

func play_dedicated(animation_identifier: String, exectuion_count: int) -> void:
	player.play(animation_name)
