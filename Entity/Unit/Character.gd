extends CharacterBody2D

signal attack
var speed = 100
var wait = 1
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

func Attack():
	if canAttack:
		emit_signal("attack", power) # Qui passiamo il nome del segnale e il valore di 'power' come argomento
		canAttack = false
		$Timer.start(wait)
		print($Timer.time_left)

func _on_Timer_timeout():
	canAttack = true
	$Timer.wait_time(1)

func _on_hurtbox_body_entered(body):
	if body.name in "Enemy" :
		canMove = false
		$Timer.wait_time(2)
		Attack()
		
