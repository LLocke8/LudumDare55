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

@export var animation : Node

var can_attack : bool = true
@export var is_melee : bool = false

func _process(delta):
	if primary == null:
		if target != null and !owner.is_stopped:
			attack()
	else:
		if target != null and !owner.is_stopped and primary.target == null:
			attack()

func attack():
	if can_attack:
		if is_melee:
			if owner.is_player:
				animation.play("Attack")
			else:
				animation.play("Attack_enemy")
		target.hp -= damage
		$Attack_speed.start()
		can_attack = false
	#fai partile l'animazione d'attacco 

func _on_attack_speed_timeout():
	can_attack = true

func _on_attack_speed_ready():
	$Attack_speed.wait_time = attack_speed 
