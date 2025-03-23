class_name cercueil extends TextureRect

var pos_cercueil : Vector2

@export var image_ferme : Texture
@export var image_ouvert : Texture

func _ready() -> void:
	texture = image_ferme
	visible=false

func introduce():
	visible = true
	self_modulate.a = 0
	pos_cercueil = position
	
	pos_cercueil.x += 50
	var tween = get_tree().create_tween()
	var col: Color = self_modulate
	col.a = 1
	tween.set_parallel(true)
	tween.tween_property(self, "self_modulate", col, 1)
	tween.tween_property(self, "position", pos_cercueil, 1)

func open():
	texture = image_ouvert
