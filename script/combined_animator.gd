class_name CombinedAnimator

extends Node

var animations : Dictionary

var processing : bool = false

func _init(process_initially: bool) -> void:
		processing = process_initially
		reset_animations()
			
func reset_animations() -> void:
	# TODO
	for key in animations.keys():
		animations.get(key).stop()

func put_animation_player(identifier: String, player: AnimationPlayer, animation_name: String, start_delay: float) -> void:
	animations.set(identifier, AnimationWrapper.new(player, identifier, animation_name, start_delay))
	
func stop_processing() -> void:
	processing = false
	for key in animations.keys():
		animations.get(key).reset_start_delay()
	
func start_processing() -> void:
	processing = true

func on_process(delta: float) -> void:
	if processing:
		for key in animations.keys():
			if !animations.get(key).is_playing():
				animations.get(key).play(delta)

func stop_animating(animation_identifier: String) -> void:
	animations.get(animation_identifier).stop()

func play_once(animation_identifier: String) -> void:
	animations.get(animation_identifier).play_single(animation_identifier)
