extends Area2D

class_name Aggro

@export var range : float = 200 :
	set(nrange) : 
		range = nrange
		$CollisionShape2D.shape.radius = range

signal target_changed(ntarg : Entity)

var target : Entity : 
	set(ntarg):
		target = ntarg
		emit_signal("target_changed",target)

var is_locked : bool = false 

func _ready():
	if !owner.is_player:
		set_collision_mask_value(1,1)
		set_collision_mask_value(2,1)
		set_collision_mask_value(3,0)
		set_collision_mask_value(4,0)

func _on_body_entered(body):
	if body is Entity and body != owner:
		aggro_Entity(body)

func update_aggro():
	target = check_aggro()
	if target:
		is_locked = true
	else:
		is_locked = false

func check_aggro() -> Entity:
	var bodies = get_overlapping_bodies()
	if bodies.is_empty():
		return
	var distance = 9999
	var closest_body : Entity
	for body in bodies:
		if body is Entity and body != owner and body != target:
			var ndis = global_position.distance_to(body.global_position)
			if ndis < distance:
				distance = ndis
				closest_body = body
	return closest_body

func aggro_Entity(Ent : Entity):
	if Ent.is_player != owner.is_player and !is_locked:
		target = Ent 
		is_locked = true

func _on_body_exited(body):
	if body == target:
		update_aggro()
