extends Area2D

@export var area : float = 200 :
	set(narea) : 
		area = narea
		$CollisionShape2D.shape.radius = area

var target : Entity

var is_locked : bool = false 

func _on_collision_shape_2d_ready():
	area = area

func _on_body_entered(body):
	if body is Entity:
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
		if body is Entity:
			var ndis = position.distance_to(body)
			if ndis < distance:
				distance = ndis
				closest_body = body
	return closest_body

func aggro_Entity(Ent : Entity):
	if Ent.is_player != owner.is_player and !is_locked:
		target = Ent 
		is_locked = true
