extends Node2D

@onready var ennemi_spirituel: CharacterBody2D = $Ennemi_Spirituel

@export var base_position:Vector2

const SPEED=300.0


func _ready() -> void:
	ennemi_spirituel.position=base_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ennemi_spirituel._is_targeting():
		if ennemi_spirituel.position.distance_to(ennemi_spirituel._get_target())<30.0:
			ennemi_spirituel.attack()
			await get_tree().create_timer(3.0).timeout

func return_to_base(body):
	pass
	
