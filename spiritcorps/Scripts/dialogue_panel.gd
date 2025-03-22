class_name Dialogue_Panel extends Control

@onready var rich_text_label: RichTextLabel = $NinePatchRect/TextureRect/RichTextLabel


func set_text(text: String):
	rich_text_label.text = text
