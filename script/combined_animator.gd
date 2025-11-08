class_name CombinedAnimator

extends Node

var animations : Dictionary

func put_animation_player(identifier: String, player: AnimationPlayer, animation_name: String) -> void:
	animations.set(identifier, AnimationWrapper.new(player, identifier, animation_name))
	
func start() -> void:
	for key in animations.keys():
		animations.get(key).play()
		
func stop() -> void:
	for key in animations.keys():
		animations.get(key).stop()

func on_process() -> void:
	for key in animations.keys():
		var a = animations.get(key)
		# print(a.get_playing_speed())
		if !a.is_playing():
			a.play()
