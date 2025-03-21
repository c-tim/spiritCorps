extends CharacterBody2D

const SPEED = 300.0
var can_move = true

func _physics_process(delta: float) -> void:
	
	if can_move:
		var direction_x := Input.get_axis("Gauche","Droite")
		var direction_y := Input.get_axis("Haut","Bas")
		if direction_x:
			velocity.x = direction_x * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		if direction_y:
			velocity.y = direction_y * SPEED
		else:
			velocity.y = move_toward(velocity.y,0,SPEED)
	else :
		velocity.x=0
		velocity.y=0

	move_and_slide()
	

func is_waiting(is_body:bool)->void:
	can_move=is_body
