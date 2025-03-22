extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0


func _physics_process(delta: float) -> void:
	
	move_and_slide()

func sprite(nom:String):
	anim.play(nom)
