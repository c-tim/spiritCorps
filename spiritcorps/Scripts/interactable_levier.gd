class_name interactable_levier extends Node2D

signal levier_activated()

var lever_is_activate : bool = false
var sprite : AnimatedSprite2D 


func _ready() -> void:
	sprite = $AnimatedSprite2D

func action_interract():
	
	if lever_is_activate :
		sprite.play("Desactivate")
		
	else :
		sprite.play("Activate")
		levier_activated.emit()
