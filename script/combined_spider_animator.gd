class_name CombinedSpiderAnimator

extends Node

const LEG_1 = "LEG_1"
const LEG_2 = "LEG_2"
const LEG_3 = "LEG_3"
const LEG_4 = "LEG_4"

const WALK_ANIMATION: String = "LegAnimation"

var animations : Dictionary

func put_animation_player(identifier: String, player: AnimationPlayer) -> void:
	animations.set(identifier, player)
	
func _on_pressed():
	print("on_animation_finished...")

func start_walking() -> void:
	animations.get(LEG_1).play(WALK_ANIMATION)
	animations.get(LEG_2).play(WALK_ANIMATION)
	animations.get(LEG_3).play(WALK_ANIMATION)
	animations.get(LEG_4).play(WALK_ANIMATION)

func stop_walking() -> void:
	animations.get(LEG_1).stop()
	animations.get(LEG_2).stop()
	animations.get(LEG_3).stop()
	animations.get(LEG_4).stop()

func on_process() -> void:
	for key in animations.keys():
		var a = animations.get(key)
		print(a.get_playing_speed())
		if !a.is_playing():
			a.play(WALK_ANIMATION)
