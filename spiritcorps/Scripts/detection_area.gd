extends Area2D

signal ame(body:CharacterBody2D)
signal exited(body)

func _ready() -> void:
	connect("body_entered",Callable(self,"_on_body_entered"))
	connect("body_exited",Callable(self, "_on_body_exited"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_body_entered(body):
	emit_signal("ame",body)

func _on_body_exited(body):
	emit_signal("exited",body)
