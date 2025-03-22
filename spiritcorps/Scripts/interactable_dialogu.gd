class_name Dialogu_Interactable extends Node2D

@export var list_text_display : Array[String]

var current_id_text_shown :int=0

signal show_dialogu_to_player(text : String)
signal hide_dialogu_to_player()

func action_interract(player : Node):
	if current_id_text_shown >= len(list_text_display):
		end_dialogu()
	show_dialogu_to_player.emit(list_text_display[current_id_text_shown])
	current_id_text_shown+=1
		
func end_dialogu():
	current_id_text_shown =0
	hide_dialogu_to_player.emit()
