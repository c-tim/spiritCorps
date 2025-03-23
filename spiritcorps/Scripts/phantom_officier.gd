class_name Phantom_Officier_Presentation extends TextureRect

var pos_phantom : Vector2
var correction : int = 51

func _ready() -> void:
	visible = false


func introduce_himself():
	visible = true
	self_modulate.a = 0
	pos_phantom = position
	pos_phantom.y += correction
	pos_phantom.x -= 50
	var tween = get_tree().create_tween()
	var col: Color = self_modulate
	col.a = 1
	tween.set_parallel(true)
	tween.tween_property(self, "self_modulate", col, 1)
	tween.tween_property(self, "position", pos_phantom, 1)
