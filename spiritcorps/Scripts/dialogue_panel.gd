class_name Dialogue_Panel extends Control

enum {HIDDEN, SHOWING_DIALOGU_PANEL, WRITE_TEXT, FULL_DISPLAY}

const STEP_VISIBLE_RATIO : float = 0.04


var objective_visible_ratio :float= 0
var current_visible_ratio :float=0 :
	set(value):
		current_visible_ratio = value
		showed_text.visible_ratio = current_visible_ratio
		

@onready var showed_text: RichTextLabel = $NinePatchRect/TextureRect/RichTextLabel

func _ready() -> void:
	hide_dialogue_panel()
	#display_text("bla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla bla")

func _process(delta: float) -> void:
	if current_visible_ratio <= 1 :
		current_visible_ratio+=STEP_VISIBLE_RATIO


func display_text(text: String):
	showed_text.text = text
	current_visible_ratio =0
	visible = true

func hide_dialogue_panel():
	showed_text.text = ""
	visible = false
	
