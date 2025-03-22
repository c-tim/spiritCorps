extends CharacterBody2D

@onready var detection_area: Area2D = $DetectionArea
@onready var attack_area: Area2D = $AttackArea

const SPEED = 300.0
var player:CharacterBody2D
const DIST_MIN = 15.0
var targeting=false
var target:Vector2
const attack_time=0.3
const DIST_ATT = 75.0
var retreat=false
var base:Vector2

signal must_return_to_base(body)

func _physics_process(delta: float) -> void:
	print(targeting)
	if targeting and target.distance_to(position)>DIST_MIN:
		var direction = (position-target).normalized()
		velocity=direction*SPEED
	else:
		velocity=Vector2.ZERO
	
	if retreat:
		if base.distance_to(position)>0.01:
			var direction = (base-position).normalized()
			velocity=direction*SPEED
		else:
			retreat=false
			velocity=Vector2.ZERO


	move_and_slide()

func follow(body):
	target=body.position
	targeting=true

func not_target(body):
	targeting=false
	emit_signal("must_return_to_base",body)

func attack():
	attack_area.monitoring=true
	print("attaque")
	await get_tree().create_timer(attack_time).timeout
	attack_area.monitoring=false
	
func _is_targeting():
	return targeting

func _get_target():
	return target

func return_to_base(pos):
	retreat=true
	base=pos
