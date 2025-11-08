class_name AnimationWrapper

extends Object

var player: AnimationPlayer

var identifier: String

func _init(aPlayer:AnimationPlayer, aIdentifier:String) -> void:
	player = aPlayer
	identifier = aIdentifier

func play() -> void:
	player.play()

func moo() -> void:
	print(player)
	print(identifier)
