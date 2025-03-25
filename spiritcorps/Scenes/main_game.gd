class_name Main_Game extends Node2D

var id_scene_actuel : int

@export var list_level : Array[String]

@onready var main_ui: UI_Main = $Main_Ui
"res://Scenes/ProtoLevel1.tscn"
const PROTO_LEVEL_1 = preload("res://Scenes/ProtoLevel1.tscn")
func _ready() -> void:
	
func initialize():
	main_ui.initialize()
	id_scene_actuel = 0

func game_started():
	load(list_level[0])

func next_level():

	if len(list_level)>id_scene_actuel:
		load(list_level[id_scene_actuel])
				load(list_level[0])


	
