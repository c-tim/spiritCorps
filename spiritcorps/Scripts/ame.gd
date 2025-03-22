extends CharacterBody2D

@onready var collision_ame: CollisionShape2D = $Collision_Ame

const SPEED = 600.0

func _physics_process(delta: float) -> void:

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

	move_and_slide()

func is_moving(is_body:bool)->void:
	if is_body:
		collision_ame.disabled = true
	else :
		collision_ame.disabled = false
	
