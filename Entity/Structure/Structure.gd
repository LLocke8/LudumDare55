extends Entity

class_name Structure

func _ready():
	if is_player:
		set_collision_layer_value(1,0)
		set_collision_layer_value(2,1)
	else:
		set_collision_layer_value(1,0)
		set_collision_layer_value(4,1)
		set_collision_mask_value(1,1)
		set_collision_mask_value(2,1)
		set_collision_mask_value(3,0)
		set_collision_mask_value(4,0)
	
