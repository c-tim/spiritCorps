class_name UI_Main extends Control


@onready var background_menu: TextureRect = $NinePatchRect/Background_Menu


func _ready() -> void:
	background_menu.visible = true
