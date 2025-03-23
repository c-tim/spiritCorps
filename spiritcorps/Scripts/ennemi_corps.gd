extends CharacterBody2D

@onready var detection_zone: Area2D = $DetectionZone
@onready var attack_zone: Area2D = $AttackZone
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 200.0
var target
var is_targeting=false
const DIST_MIN = 150.0
const attack_time=0.3
const DIST_ATT =200.0
const ATT_DELAY = 2.5
var attacking=false



func _physics_process(delta: float) -> void:
	if is_targeting :
		if target.global_position.distance_to(global_position)<DIST_ATT and !attacking:
			attack()
		elif target.global_position.distance_to(global_position)>DIST_MIN:
			var direction=(target.global_position - global_position).normalized()
			velocity = direction * SPEED

	else:
		velocity=Vector2.ZERO
	
	if velocity.x:
		animation.flip_h=velocity.x > 0
	move_and_slide()

func targeting(body):
	target=body
	is_targeting=true
	
func no_target(body):
	is_targeting=false

func attack():
	attacking=true
	attack_zone.monitoring=true
	print("attaque ennemie")
	await get_tree().create_timer(attack_time).timeout
	attack_zone.monitoring=false
	print("fin attaque")
	await get_tree().create_timer(ATT_DELAY).timeout
	attacking=false
