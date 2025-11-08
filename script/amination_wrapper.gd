class_name AnimationWrapper

extends Object

var player: AnimationPlayer

var identifier: String

var animation_name: String

func _init(aPlayer:AnimationPlayer, aIdentifier:String, aName:String) -> void:
	player = aPlayer
	identifier = aIdentifier
	animation_name = aName

func play() -> void:
	player.play(animation_name)

func stop() -> void:
	player.stop()

func is_playing() -> bool:
	return player.is_playing()
