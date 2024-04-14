extends CharacterBody2D


const speed=100




func _process(delta):
	global_position.x -= speed * delta
