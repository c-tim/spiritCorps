class_name Petit_fantome extends Node2D

@onready var petit_fantome: CharacterBody2D = $Petit_fantome
@onready var anim: AnimatedSprite2D = $Petit_fantome/AnimatedSprite2D

var id_in_phantom_list : int

const STEP_PHANTOM :int= 5
const RANGE_SLIDE : int = 10
var objective_pos : Vector2
var update_sprite = false
var dialogu_before_pickup : Array[String]
var target
var id_dialogue_pkaying : int
var waiting = false
const layer_brume = 5

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
	if update_sprite:
		anim.flip_h=(target.global_position.x-global_position.x)>=0
	if _is_waiting():
		return
	
	var distance = position.distance_to(objective_pos)
	if distance <= STEP_PHANTOM:
		position = objective_pos
		return
	
	position.x = move_toward(position.x, objective_pos.x, STEP_PHANTOM/sqrt(2))
	position.y = move_toward(position.y, objective_pos.y, STEP_PHANTOM/sqrt(2))
	#position.x += randf_range(-5 * distance/(10*STEP_PHANTOM), 5*distance/(10*STEP_PHANTOM))
	#position.y += randf_range(-5*distance/(10*STEP_PHANTOM), 5*distance/(10*STEP_PHANTOM))
	_is_touching_brume()
	

func set_position_phantom(pos: Vector2):
	#position = pos
	objective_pos = pos
	
func set_line_id(id : int):
	id_in_phantom_list = id


func _on_detection_area_player_detected(body: Variant) -> void:
	send_petitFantom_to_player.emit(self)

func change_sprite(body):
	update_sprite=true
	target=body

func _is_waiting():
	return waiting

func change_following():
	waiting = !waiting
	

func _is_touching_brume():
	print('dans la fonction')
	var motion=petit_fantome.velocity
	var collision = petit_fantome.move_and_collide(motion,true)
	if collision:
		print('collision')
		var collider = collision.get_collider()
		print(collider)
		if collider is TileMapLayer:
			print("collider")
			print(collider.get_cell_source_id(collision.get_position()))
			var tile_data=collider.get_cell_tile_data(collision.get_position())
			
			if tile_data:
				print("tiledata")
				for layer_index in range(tile_data.get_collision_layer_count()):
					var collision_layer = tile_data.get_collision_layer(layer_index)
					if collision_layer == (1 << layer_brume):
						print('collision avec brume')
			
