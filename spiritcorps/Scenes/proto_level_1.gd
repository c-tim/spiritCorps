extends Node2D
@export var camera: Camera_follow


func get_ame_child_to_pass_to_camera(node: Node2D):
	camera.change_follow(node)
