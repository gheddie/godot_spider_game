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

func put_animation_player(identifier: String, player: AnimationPlayer, animation_name: String, start_delay: float, aSingleFire: bool) -> void:
	animations.set(identifier, AnimationWrapper.new(player, identifier, animation_name, start_delay, aSingleFire))
	
func stop_processing() -> void:
	processing = false
	for key in animations.keys():
		animations.get(key).reset_start_delay()
	
func start_processing() -> void:
	processing = true

func on_process(delta: float) -> void:	
	if processing:
		for key in animations.keys():
			var animation_wrapper: AnimationWrapper = animations.get(key)
			if !animation_wrapper.is_playing() and !animation_wrapper.single_fire:
				animation_wrapper.play(delta)

func stop_animating(animation_identifier: String) -> void:
	animations.get(animation_identifier).stop()

func play_dedicated(animation_identifier: String, exectuion_count: int) -> void:
	animations.get(animation_identifier).play_dedicated(animation_identifier, exectuion_count)
