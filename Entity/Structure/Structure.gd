extends Entity

class_name Structure

func _ready():
	super()
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
	
func on_next_phase(phase):
	if phase: #Combattimento
		is_stopped = false
	else: #preparazione
		is_stopped = true
