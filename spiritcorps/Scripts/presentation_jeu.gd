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
			#phantom_officier.introduce_himself()
			send_text_to_player.emit(":)")
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
		
		_ : 
			print("launch_game")

			send_text_to_player.emit("Nous avons repere un certain de fantomes perdus dans un manoir abandonne.")
		3 :
			send_text_to_player.emit("Votre mission si vous l'acceptez et daller sauver ces fantomes.")
		4 : 
			send_text_to_player.emit("J'ai proposé par politesse mais vous n’avez pas le choix.")
		5 :
			send_text_to_player.emit("Voici votre habitacle.")
		6 : 
			send_text_to_player.emit("Nous savons a quel point vous appreciez votre pilosite. Nous vous faisons une fleur et avons selectionne ce corps specialement pour vous.")
		7 :
			send_text_to_player.emit("Faites attention à ne pas trop l'endommager. On ne pourra pas vous recuperer si vous le perdez.")
		8 : 
			send_text_to_player.emit("Filez maintenant! Des fantomes en detresse vous attendent!")

