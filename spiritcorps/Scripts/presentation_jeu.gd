class_name presentation_panel extends Control


@onready var phantom_officier: Phantom_Officier_Presentation = $Phantom_Officier
@onready var cercueil: cercueil = $Cercueil
@onready var cadavre: cadavre = $cadavre

var pos_phantom : Vector2

var is_doing_animation :bool

var step_animation :int =0
@export var offset_phantom: Vector2

signal send_text_to_player(t : String)
signal close_dialogue_panel()

func _ready() -> void:
	setup_presentation()

func setup_presentation():
	step_animation = 0
	is_doing_animation = false
	#print("position ", phantom_officier.position)


	#phantom_officier.position =(pos_phantom + tab_container.position)

	#tween.tween_callback(phantom_officier.queue_free)
	'''tween.tween_property($Sprite, "scale", Vector2(), 1).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_callback($Sprite.queue_free)'''
func next_step_animation():
	if is_doing_animation:
		return
	step_animation += 1
	match step_animation:
		1 :
			phantom_officier.introduce_himself()
			send_text_to_player.emit("texte 1")
		2 : 
			send_text_to_player.emit(" texte 2")
		
		3: 
			send_text_to_player.emit("rebalbal")
		4 : 
			cercueil.introduce()	
		5 : 
			is_doing_animation = true
			close_dialogue_panel.emit()
			await get_tree().create_timer(1).timeout 
			cercueil.open()
			await get_tree().create_timer(1).timeout 
			cadavre.introduce()
			is_doing_animation = false
