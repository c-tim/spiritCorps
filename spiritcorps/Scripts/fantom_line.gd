class_name Phantom_line extends Node2D

const SPACING_PHANTOM_IN_LINE = 25

@export var list_markers : Array[Marker2D]
var number_phantom_following := 0

func add_phantom_and_get_position() -> Vector2:
	number_phantom_following+=1
	#on enleve un car le premier phantom est a 0
	return list_markers[number_phantom_following-1].position

func get_pos_phantom(id : int)-> Vector2:
	return list_markers[id].position


func check_move_line_phantom(pos_player : Vector2):
	if len(list_markers)==0:
		return
	#if abs(pos_player - list_markers[0].position)>SPACING_PHANTOM_IN_LINE:
	if pos_player.distance_to(list_markers[0].position)>SPACING_PHANTOM_IN_LINE:
		update_line_pos(pos_player)

func update_line_pos(new_pos: Vector2):
	var n:= len(list_markers)
	for i in range(n):
		list_markers[n-i-1].position = list_markers[n-i-2].position
	list_markers[0].position=new_pos
	
