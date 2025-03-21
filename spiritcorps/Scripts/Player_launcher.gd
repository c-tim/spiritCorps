extends Node2D

@onready var corps: CharacterBody2D = $Corps
@onready var ame: CharacterBody2D = $Ame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ame.visible=false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Switch"):
		ame.visible=!ame.visible
	
