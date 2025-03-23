extends Area2D

@export var fantomes_requis : int

@onready var label: Label = $Label
@onready var timer: Timer = $Timer

signal fin_niveau() 

func _on_body_entered(body: Node2D) -> void:
	print("OOO")
	if body.get_parent() is Player:
		var player = body.get_parent()
		print("AAAA")
		if player.fantom_line.number_phantom_following >= fantomes_requis:
			fin_niveau.emit()
			print("BBB")
		else:
			if fantomes_requis == 1:
				label.text = str(fantomes_requis) + " fantôme requis !"
			else:
				label.text = str(fantomes_requis) + " fantômes requis !"
			print("CCC")
			timer.start()

func _on_timer_timeout() -> void:
	label.text = ""
