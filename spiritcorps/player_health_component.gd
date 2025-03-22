class_name Health_Component extends Node2D


var current_healh : int

@export var max_health : int

signal update_health()
signal player_died()


func initialize_health():
	current_healh = max_health

func take_damage(damage : int):
	current_healh -= damage
	update_health.emit()
	if current_healh <= 0:
		player_died.emit()
