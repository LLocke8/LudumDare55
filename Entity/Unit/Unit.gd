extends Entity

class_name Unit

@export var speed : int = 100
@export var base_dir : Vector2
@export var dir : Vector2

func _ready():
	if is_player:
		base_dir = Vector2(1,0)
	else:
		base_dir = Vector2(-1,0)
		set_collision_layer_value(1,0)
		set_collision_layer_value(3,1)
		set_collision_mask_value(1,1)
		set_collision_mask_value(2,1)
		set_collision_mask_value(3,0)
		set_collision_mask_value(4,0)
	dir = base_dir
	

func _physics_process(delta):
	var movement = move(delta,dir)

func move(delta, direction : Vector2):
	var movement = direction * delta * speed
	move_and_collide(movement)

#func _on_hurtbox_body_entered(body):
	#print(body.name)
	#if body.name in "Character":
		#pass

#func get_direction():
	#var direction = $RayCast2D.target_position
	#if direction.x > 0:
		#return "right"
	#if direction.x < 0:
		#return "left"
	#if direction.y > 0:
		#return "down"
	#if direction.y < 0:
		#return "up"    
