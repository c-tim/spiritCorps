extends RigidBody2D

var player_is_near : bool = false


func _ready() :
	pass


func _process(delta: float) -> void:
	pass


func desable(active : Node2D) :
	active.set_process(false)



func player_near(body: Node2D) -> void:
	if body is Player :
		player_is_near = true
