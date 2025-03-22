extends Node2D

@onready var ennemi_spirituel: CharacterBody2D = $Ennemi_Spirituel

@export var base_position:Vector2

const SPEED=300.0
const dist_att=100


func _ready() -> void:
	ennemi_spirituel.global_position=base_position
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


	
