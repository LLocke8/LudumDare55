extends CharacterBody2D

signal sign_attack
var speed = 100
var wait = 2.0
var hp = 100
var power = 20
var canMove = true
var canAttack = true

func _physics_process(delta):
	if canMove:
		var movement = straight_movement(delta, speed)
		if movement != Vector2.ZERO:
			$RayCast2D.target_position = movement * 70
			$Hurtbox.position = $RayCast2D.target_position * 1.15

func straight_movement(delta, speed: int):
	var velocity = Vector2()
	velocity.x += 1
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


func attack(body):
	var healt = body.hp
	while(healt >=0):
		await get_tree().create_timer(wait).timeout
		emit_signal("sign_attack",power)

	

func _on_hurtbox_body_entered(body):
	if body.name in "Enemy" :
		canMove = false
		attack(body)
	
