extends CharacterBody2D

@onready var detection_area: Area2D = $DetectionArea
@onready var attack_area: Area2D = $AttackArea
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 250.0
const DIST_MIN = 30.0
var targeting=false
var target
const attack_time=0.3
const DIST_ATT = 55.0
const ATT_DELAY = 3.0
var attacking=false


func _physics_process(delta: float) -> void:
	if targeting :
		if target.global_position.distance_to(global_position)<DIST_ATT and !attacking:
			attack()
		elif target.global_position.distance_to(global_position)>DIST_MIN:
			var direction=(target.global_position - global_position).normalized()
			velocity = direction * SPEED
	else:
		velocity=Vector2.ZERO
	
	if velocity.x:
		animation.flip_h=position.x>0

	move_and_slide()

func follow(body):
	target=body
	targeting=true

func not_target(body):
	targeting=false
	emit_signal("must_return_to_base",body)

func attack():
	attacking=true
	attack_area.monitoring=true
	print("attaque ennemie")
	await get_tree().create_timer(attack_time).timeout
	attack_area.monitoring=false
	print("fin attaque")
	await get_tree().create_timer(ATT_DELAY).timeout
	attacking=false
	
	

	
func _is_targeting():
	return targeting

func _get_target():
	return target
