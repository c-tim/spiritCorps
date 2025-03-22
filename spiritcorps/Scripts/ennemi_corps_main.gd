extends Node2D

@onready var ennemi_corps: CharacterBody2D = $ennemi_corps

@export var base_position:Vector2


func _ready() -> void:
	ennemi_corps.global_position=base_position


func _process(delta: float) -> void:
	pass
