extends Aggro

class_name Attack

@export var damage : int = 10 : 
	set(ndam):
		damage = ndam

@export var attack_speed : float = 2 :
	set(natkspeed):
		attack_speed = natkspeed
		if $attack_speed:
			$Attack_speed.wait_time = attack_speed 

@export var primary : Node

var can_attack : bool = true


func _process(delta):
	if primary == null:
		if target != null and !owner.is_stopped:
			attack()
	else:
		if target != null and !owner.is_stopped and primary.target == null:
			attack()

func attack():
	if can_attack:
		target.hp -= damage
		$Attack_speed.start()
		can_attack = false
	#fai partile l'animazione d'attacco 

func _on_attack_speed_timeout():
	can_attack = true

func _on_attack_speed_ready():
	$Attack_speed.wait_time = attack_speed 
