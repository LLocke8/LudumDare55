extends Unit

class_name Skeleton_Archer

@export var aggro_node : Node
@export var attack_node : Node

func _process(delta):
	if attack_node.target != null:
		dir = Vector2(0,0)
	elif aggro_node.target != null:
		dir = global_position.direction_to(aggro_node.target.global_position)
	else:
		dir = base_dir

func _ready():
	super()
	if is_player:
		attack_node.position += Vector2(200,0)
	else:
		attack_node.position += Vector2(-200,0)
