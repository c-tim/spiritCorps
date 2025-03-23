extends CharacterBody2D

@onready var collision_ame: CollisionShape2D = $Collision_Ame
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
var real_SPEED= SPEED
var moving = false

func _physics_process(delta: float) -> void:

	if !moving:
		return

	var direction_x := Input.get_axis("Gauche","Droite")
	var direction_y := Input.get_axis("Haut","Bas")
	if direction_x:
		velocity.x = direction_x * real_SPEED
		if direction_y:
			velocity.x=velocity.x/(2**(1/2))
	else :
		velocity.x=move_toward(velocity.x,0,real_SPEED)
	if direction_y :
		velocity.y=direction_y*real_SPEED
		if direction_x:
			velocity.y=velocity.y/(2**(1/2))
	else : 
		velocity.y=move_toward(velocity.y,0,real_SPEED)

	move_and_slide()

func is_moving(is_body:bool)->void:
	collision_ame.disabled=is_body
	set_collision_layer_value(2,!is_body)
	moving=!is_body

func eloignement(k:float)->void:
	real_SPEED=k*SPEED
	
