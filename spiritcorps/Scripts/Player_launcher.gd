extends Node2D

@onready var corps: CharacterBody2D = $Corps
@onready var ame: CharacterBody2D = $Ame

var is_body=true
var ralentissement=1.0


func _ready() -> void:
	ame.visible=false
	ame.position=corps.position
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Switch"):
		ame.visible=!ame.visible
		is_body=!is_body
		switching(is_body)
	limit_ame(ame.position.distance_to(corps.position))
		
func switching(is_body:bool) :
	ame.is_moving(is_body)
	corps.is_waiting(is_body)
	if is_body:
		ame.position=corps.position

func limit_ame(dist:float):
	if dist >= 500:
		ralentissement= 1-((dist-500)/dist)*1.25
		ame.eloignement(ralentissement)
	if dist<500:
		ame.eloignement(1)
		

	
	
