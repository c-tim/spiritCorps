extends CharacterBody2D

@onready var zone_attaque: Area2D = $Zone_Attaque

const SPEED = 600.0
const attack_delay = 0.3
var can_move = true
var attacking = false

func _physics_process(delta: float) -> void:
	
	if can_move:
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
		
		if Input.is_action_just_pressed("Attaque") and !attacking:
			attack()
	else :
		velocity.x=0
		velocity.y=0

	move_and_slide()
	

func is_waiting(is_body:bool)->void:
	can_move=is_body

func attack():
	attacking=true
	zone_attaque.monitoring=true
	await get_tree().create_timer(attack_delay)
	zone_attaque.monitoring=false
	attacking=false
	
	
