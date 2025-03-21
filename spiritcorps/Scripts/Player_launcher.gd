extends Node2D

@onready var corps: CharacterBody2D = $Corps
@onready var ame: CharacterBody2D = $Ame

var is_body=true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ame.visible=false
	ame.position=corps.position
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Switch"):
		ame.visible=!ame.visible
		is_body=!is_body
		switching(is_body)
		
func switching(is_body:bool) :
	ame.is_moving(is_body)
	corps.is_waiting(is_body)
	if is_body:
		ame.position=corps.position
	
	
