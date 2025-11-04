extends Node3D

@onready var animator: AnimationPlayer = $AnimationPlayer

@onready var btn_jump: Button = $GridContainer/Jump
@onready var btn_shrink: Button = $GridContainer/Shrink

@onready var anim: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	
	btn_jump.pressed.connect(jump_up)
	btn_shrink.pressed.connect(shrink_down)	
	
func _process(delta: float) -> void:
	pass

# jump is from second 2.0
func jump_up():
	print("jump up...")
	anim.seek(2.0)
	anim.play("CubeAction")
	
# shrink is from start
func shrink_down():
	print("shrink down...")
	anim.play("CubeAction")		
	
func play_animation() -> void:
	anim.seek(1.0)
	anim.play("CubeAction")		

func on_shrinked() -> void:
	pass
