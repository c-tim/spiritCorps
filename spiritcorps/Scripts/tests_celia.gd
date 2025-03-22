extends Node2D
@onready var camera: Camera2D = $Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera.zoom=Vector2(1, 1080.0 / 800.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
