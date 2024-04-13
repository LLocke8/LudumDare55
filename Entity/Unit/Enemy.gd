extends CharacterBody2D

var speed = 100
var hp = 100
var power = 20
var canMove = true

func _physics_process(delta):
	if canMove:
		var movement = straight_movement(delta, speed)
		if movement != Vector2.ZERO:
			$RayCast2D.target_position = movement * 70
			$Hurtbox.position = $RayCast2D.target_position *1.15

func straight_movement(delta, speed: int):
	var velocity = Vector2()
	velocity.x -= 1
	var movement = velocity.normalized() * delta * speed
	move_and_collide(movement)
	return movement

func get_direction():
	var direction = $RayCast2D.target_position
	if direction.x > 0:
		return "right"
	if direction.x < 0:
		return "left"
	if direction.y > 0:
		return "down"
	if direction.y < 0:
		return "up"    

func _on_hurtbox_body_entered(body):
	print(body.name)
	if body.name in "Character":
		canMove = false




func _on_character_attack(power : int):
	hp-=power
	print(power)
	if(hp<=0):
		queue_free()
	
