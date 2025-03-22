class_name cadavre extends TextureRect

func _ready() -> void:
	visible =false

func introduce():
	visible = true
	self_modulate.a = 0

	var tween = get_tree().create_tween()
	var col: Color = self_modulate
	col.a = 1
	tween.tween_property(self, "self_modulate", col, 3)
