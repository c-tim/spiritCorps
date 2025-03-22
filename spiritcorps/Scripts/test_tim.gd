extends Node2D
@onready var camera: Camera = $Camera
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D



func _ready() -> void:
	camera.change_follow(character_body_2d)
