extends Node2D
class_name Ennemi_Spirituel_Main

@onready var ennemi_spirituel: CharacterBody2D = $Ennemi_Spirituel

@export var base_position:Vector2

const SPEED=300.0
const dist_att=100
const START_HEALTH :int = 40

var health : int


func _ready() -> void:
	initialize()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func initialize():
	health = START_HEALTH
	ennemi_spirituel.global_position=base_position
	
func take_damage(damage : int):
	health -= damage
	print("arrrrf ennemi a ", health)
	if health <=0 :
		ennemi_died()

func ennemi_died():
	queue_free()
	


	
