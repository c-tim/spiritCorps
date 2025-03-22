class_name Interactable_Element_Holder extends Node2D

@export var is_interactable :bool = true
@export var child_interracted : Node2D

@onready var area: Area2D = $Area2D
<<<<<<< HEAD

=======
>>>>>>> Jason
	
func test_to_interract_with_body(player : Node):
	if not is_interactable:
		return
	interact(player)

func interact(player: Node):
	if not child_interracted.has_method("action_interract"):
		push_error("erreur pas de fonction a interragir")
	child_interracted.action_interract(player)
	
