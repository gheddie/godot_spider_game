class_name CombinedAnimator

extends Node

const WALK_ANIMATION: String = "LegAnimation"

var animations : Dictionary

func put_animation_player(identifier: String, player: AnimationPlayer) -> void:
	animations.set(identifier, player)
	AnimationWrapper.new(player, identifier)
	
func start_walking() -> void:
	for key in animations.keys():
		animations.get(key).play(WALK_ANIMATION)
		
func stop_walking() -> void:
	for key in animations.keys():
		animations.get(key).stop()

func on_process() -> void:
	for key in animations.keys():
		var a = animations.get(key)
		print(a.get_playing_speed())
		if !a.is_playing():
			a.play(WALK_ANIMATION)
