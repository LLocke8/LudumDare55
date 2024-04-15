extends Structure

class_name wisp_turret

@export var attack_node : Node

func _ready():
	super()
	if is_player:
		attack_node.position += Vector2(110,0)
	else:
		attack_node.position += Vector2(-110,0)
