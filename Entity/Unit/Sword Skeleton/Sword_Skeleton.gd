extends Unit

class_name Sword_Skeleton

@export var aggro_node : Node

func _process(delta):
	if aggro_node.target != null:
		dir = global_position.direction_to(aggro_node.target.global_position)
