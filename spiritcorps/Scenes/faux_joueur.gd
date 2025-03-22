extends Node2D

@onready var presentation_panel: presentation_panel = $Control/Presentation_Jeu
@onready var dialogue_panel: Dialogue_Panel = $Control/dialogue_panel

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Attaque"):
		presentation_panel.next_step_animation()


func _on_presentation_panel_send_text_to_player(t: String) -> void:
	dialogue_panel.display_text(t)
