extends CharacterBody2D

@onready var collision_ame: CollisionShape2D = $Collision_Ame

const SPEED = 600.0

func _physics_process(delta: float) -> void:

	var direction_x := Input.get_axis("Gauche","Droite")
	var direction_y := Input.get_axis("Haut","Bas")
	if direction_x and direction_y:
		velocity.x = (direction_x * SPEED)/2**(1/2)
		velocity.y = (direction_y * SPEED)/2**(1/2)
	elif direction_x:
		velocity.x= direction_x*SPEED
	elif direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y,0,SPEED)
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func is_moving(is_body:bool)->void:
	collision_ame.disabled=is_body
	
