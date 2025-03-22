extends CharacterBody2D

const SPEED = 100

func _process(delta: float) -> void:
	velocity = Input.get_vector("ui_left" ,"ui_right", "ui_up", "ui_down")*SPEED
	move_and_slide()
