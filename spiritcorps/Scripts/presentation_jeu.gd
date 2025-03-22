class_name presentation_panel extends Control


@onready var phantom_officier: Phantom_Officier_Presentation = $Phantom_Officier

var pos_phantom : Vector2

var step_animation :int =0
@export var offset_phantom: Vector2

signal send_text_to_player(t : String)

func _ready() -> void:
	setup_presentation()

func setup_presentation():
	step_animation = 0
	#print("position ", phantom_officier.position)


	#phantom_officier.position =(pos_phantom + tab_container.position)

	#tween.tween_callback(phantom_officier.queue_free)
	'''tween.tween_property($Sprite, "scale", Vector2(), 1).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_callback($Sprite.queue_free)'''
func next_step_animation():
	step_animation += 1
	match step_animation:
		1 :
			phantom_officier.introduce_himself()
			send_text_to_player.emit("texte 1")
		2 : 
			send_text_to_player.emit(" texte 2")
