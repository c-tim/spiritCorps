class_name Petit_fantome extends Node2D

@onready var petit_fantome: CharacterBody2D = $Petit_fantome

var id_in_phantom_list : int

const STEP_PHANTOM :int= 20
const RANGE_SLIDE : int = 10
var objective_pos : Vector2

@export var numerofantome:String
@export var position_base:Vector2 

signal send_petitFantom_to_player(fantom : Petit_fantome)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	petit_fantome.sprite(numerofantome)
	#petit_fantome.global_position = position_base
	position = position_base
	objective_pos = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var distance = position.distance_to(objective_pos)
	if distance <= STEP_PHANTOM:
		position = objective_pos
		return
	
	position.x = move_toward(position.x, objective_pos.x, STEP_PHANTOM/sqrt(2))
	position.y = move_toward(position.y, objective_pos.y, STEP_PHANTOM/sqrt(2))
	position.x += randf_range(-5 * distance/(10*STEP_PHANTOM), 5*distance/(10*STEP_PHANTOM))
	position.y += randf_range(-5*distance/(10*STEP_PHANTOM), 5*distance/(10*STEP_PHANTOM))

	
func set_position_phantom(pos: Vector2):
	#position = pos
	objective_pos = pos
	
func set_line_id(id : int):
	id_in_phantom_list = id


func _on_detection_area_player_detected(body: Variant) -> void:
	send_petitFantom_to_player.emit(self)
