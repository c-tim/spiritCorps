class_name UI_Main extends Control


@onready var background_menu: TextureRect = $NinePatchRect/Background_Menu


func _ready() -> void:
	initialize()


func initialize(): 
	background_menu.visible = true


func _on_button_quit_pressed() -> void:
	get_tree().quit()
