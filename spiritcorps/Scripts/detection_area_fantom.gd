extends Area2D

signal player_detected(body)
signal look_at_player(body)

func _ready() -> void:
	connect("body_entered",Callable(self,"_on_body_entered"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body):
	if body.get_parent() is Player:
		emit_signal("player_detected",body)
		emit_signal("look_at_player",body)
