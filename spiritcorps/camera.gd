class_name Camera_follow extends Camera2D

const COOLDOWN_FOLLOW : float = 0.3
const RANGE_STOP_MOVING := 20
const STEP_MOVING_CAMERA : float =5

var current_target : Node2D
var current_cooldown :float = 0


var start_pos : Vector2
var current_ratio_translation_position 




func _process(delta: float) -> void:
	# sometimes the ugliest method works
	# lets pray that the player will not be too fast
	#okay 3rd option
	
	if position != current_target.global_position:
		tp_with_delay_to_player((current_target.global_position))
	
	
	
	'''if (position).distance_to((current_target.position))<=STEP_MOVING_CAMERA:
		position = (current_target.position)
		return
	
	position.x = move_toward(position.x, current_target.position.x, STEP_MOVING_CAMERA/sqrt(2))
	position.y = move_toward(position.y, current_target.position.y, STEP_MOVING_CAMERA/sqrt(2))
	'''
	
	
	


'''
	print((position).distance_to(to_local(current_target.position)))
	if not current_target:
		return
	if (position).distance_to(to_local(current_target.position))<=RANGE_STOP_MOVING:
		print("reached pos joueur")
		start_pos = to_global(position)
		position = to_local(current_target.position)
		current_ratio_translation_position = 0
		return
	
	if current_cooldown <= COOLDOWN_FOLLOW :
		print("waiting cooldown")
		current_cooldown+=1
		return
	print("move")
	position = lerp(start_pos, to_global(current_target.position), current_ratio_translation_position)
	current_ratio_translation_position+=STEP_MOVING_CAMERA'''

func tp_with_delay_to_player(pos: Vector2):
	await get_tree().create_timer(COOLDOWN_FOLLOW).timeout
	position = pos
	
func reset_cooldown():
	current_cooldown = 0	

func change_follow(target : Node2D):
	current_target = target
	current_cooldown = 0
	
