class_name Petit_fantome extends Node2D

@onready var petit_fantome: CharacterBody2D = $Petit_fantome

@export var numerofantome:String
@export var postion_base:Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	petit_fantome.sprite(numerofantome)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
