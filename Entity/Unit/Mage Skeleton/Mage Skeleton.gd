extends Unit

class_name Mage_Skeleton

@export var aggro_node : Node
@export var attack_node : Node

@export var melee_attack_node : Node

func _process(delta):
	if attack_node.target != null:
		dir = Vector2(0,0)
	elif melee_attack_node.target != null:
		dir = Vector2(0,0)
	elif aggro_node.target != null:
		dir = global_position.direction_to(aggro_node.target.global_position)
	else:
		dir = base_dir

func _ready():
	super()
	if is_player:
		attack_node.position += Vector2(100,0)
	else:
		attack_node.position += Vector2(-100,0)
