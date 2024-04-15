extends Structure

class_name Coffin

var unit = load("res://Entity/Unit/Sword Skeleton/Sword_Skeleton.tscn")

var units_spawned : int = 0

@export var spawn_time : float = 10 :
	set(nspawntime):
		spawn_time = nspawntime
		if $spawn_time != null:
			$spawn_time.wait_time = spawn_time

var offset : Vector2

func _ready():
	super()
	if is_player:
		offset = Vector2(50,0)
	else:
		offset = Vector2(-50,0)

func _on_spawn_time_timeout():
	if units_spawned < 4 and !is_stopped:
		var instance = unit.instantiate()
		instance.position = global_position + offset 
		instance.is_player = is_player
		instance.is_stopped = 0
		get_parent().add_child(instance) #cambiare per aggiungere nodo al nodo "mondo" 
		units_spawned += 1

func _on_spawn_time_ready():
	$spawn_time.wait_time = spawn_time
	$spawn_time.start()

func on_next_phase(phase):
	if phase: #Combattimento
		is_stopped = false
		$spawn_time.start()
	else: #preparazione
		is_stopped = true
		$spawn_time.stop()
		hp -= 1
		units_spawned = 0
