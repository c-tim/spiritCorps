class_name Camera extends Camera2D

const COOLDOWN_FOLLOW : int = 15
const RANGE_STOP_MOVING := 10
const STEP_MOVING_CAMERA : float =0.05

var current_target : Node2D
var current_cooldown :float = 0


var start_pos : Vector2
var current_ratio_translation_position 




func _process(delta: float) -> void:
	if not current_target:
		return
	if to_global(position).distance_to(to_global(current_target.position))<=RANGE_STOP_MOVING:
		print("reached pos joueur")
		start_pos = position
		current_ratio_translation_position = 0
		return
	
	if current_cooldown <= COOLDOWN_FOLLOW :
		print("waiting cooldown")
		current_cooldown+=1
		return
	print("move")
	position = lerp(start_pos, current_target.position, current_ratio_translation_position)
	current_ratio_translation_position+=STEP_MOVING_CAMERA
	
func reset_cooldown():
	current_cooldown = 0	

func change_follow(target : Node2D):
	current_target = target
	current_cooldown = 0
	
