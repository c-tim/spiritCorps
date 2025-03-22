class_name interactable_levier extends AnimatedSprite2D

signal levier_activated()

func _ready() -> void:
	play("levier_not_activated")

func action_interract():
	play("levier_not_activated")
	levier_activated.emit()
