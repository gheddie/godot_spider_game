class_name CombinedAnimator

extends Node

var animations : Dictionary

var processing : bool = true

func put_animation_player(identifier: String, player: AnimationPlayer, animation_name: String) -> void:
	animations.set(identifier, AnimationWrapper.new(player, identifier, animation_name))
	
func stop_processing() -> void:
	processing = false
	
func start_processing() -> void:
	processing = true

func on_process(delta: float) -> void:
	print(delta)
	if processing:
		for key in animations.keys():
			if !animations.get(key).is_playing():
				animations.get(key).play()
