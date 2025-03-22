class_name Player extends Node2D



@onready var corps: CharacterBody2D = $Corps
@onready var ame: CharacterBody2D = $Ame
@onready var fantom_line: Phantom_line = $FantomLine

const LIMIT_DIST = 500.0
var is_body=true
var ralentissement=1.0
const COOLDOWN_SWITCH = 0.5
var can_switch=true
var pos_player:Vector2

var list_phantom_following : Array[Petit_fantome]


func _ready() -> void:
	ame.animated_sprite_2d.visible=false
	ame.set_collision_layer_value(2,false)
	ame.position=corps.position
	

func _process(delta: float) -> void:
	if is_body:
		ame.position = corps.position
	if Input.is_action_just_pressed("Switch"):
		ame.animated_sprite_2d.visible=!ame.animated_sprite_2d.visible
		can_switch=false
		is_body=!is_body
		switching(is_body)
	limit_ame(ame.position.distance_to(corps.position))
	pos_player = (corps.position) if is_body else (ame.position)
	fantom_line.check_move_line_phantom(pos_player)
	update_fantom_in_line_positions()

func update_fantom_in_line_positions():
	for phantom in list_phantom_following:
		phantom.set_position_phantom((fantom_line.get_pos_phantom(phantom.id_in_phantom_list)))
		
func switching(is_body:bool) :
	ame.is_moving(is_body)
	corps.is_waiting(is_body)
	ame.position=corps.position
	await get_tree().create_timer(COOLDOWN_SWITCH).timeout
	can_switch=true
	
	

func limit_ame(dist:float):
	if dist >= LIMIT_DIST:
		var x = (dist-LIMIT_DIST)/dist
		ralentissement= 1- (8 * x**4 if x < 0.5 else 1 - (-2 * x + 2)**4 / 2)
		ame.eloignement(ralentissement)
	if dist<500:
		ame.eloignement(1)

func receive_new_fantom(phantom: Petit_fantome):
	if phantom in list_phantom_following:
		return
	list_phantom_following.append(phantom)
	phantom.set_line_id(len(list_phantom_following)-1)


		

	
	
