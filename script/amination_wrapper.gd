class_name AnimationWrapper

extends Object

var player: AnimationPlayer

var identifier: String

var animation_name: String

var delay_timer: DelayTimer

func _init(aPlayer:AnimationPlayer, aIdentifier:String, aName:String, aStartDelay: float) -> void:
	player = aPlayer
	identifier = aIdentifier
	animation_name = aName
	delay_timer = DelayTimer.new(aStartDelay)

func play(delta: float) -> void:
	delay_timer.apply_duration(delta)
	if delay_timer.has_elapsed():
		player.play(animation_name)

func stop() -> void:
	player.stop()

func is_playing() -> bool:
	return player.is_playing()
