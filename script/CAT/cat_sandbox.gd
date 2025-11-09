extends Node3D

@onready var creature: CatCreature = $CatCreature

@onready var walk: Button = $GridContainer/Walk
@onready var stop: Button = $GridContainer/Stab
@onready var stab: Button = $GridContainer/Stab

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
