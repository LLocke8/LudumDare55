extends Node2D

class_name Spawner

@export var Spawn_location : Node

@export var Waves = [
	{
	"Skeleton swordman":[Vector2(1000,250),Vector2(1000,230),Vector2(1000,200)],
	"Skeleton Archer":[Vector2(1000,300)]
	},
	]

# Called when the node enters the scene tree for the first time.

func Spawn_wave(wave : int): #enemy has  EnemyTipe -> point
	var c = 0 # simply counter
	var enemy_type = Waves[wave].keys() # take all the type  of the enemy and put them to an array
	#var spawnpoint = enemyspawn.values()# take all the spawnpoint and put them to an array
	while c < Waves[wave].size(): # while the enemy exist
		var quantity_of_enemy = Waves[wave][enemy_type[c]] # take the time that you must spawn the specific enemy
		var i = 0 # simply counter
		while i < quantity_of_enemy.size(): # how many time the same enemy must be spawned
			var enemy_scene = load(get_entity_path(enemy_type[c])) #Load the specific enemy
			var enemy = enemy_scene.instantiate()# instantiate it
			enemy.global_position = Waves[wave][enemy_type[c]][i] #set the position
			enemy.is_player = false
			Spawn_location.add_child.call_deferred(enemy) # spawn the enemy_type at the spawnpoint
			i= i + 1 # just an increase
		c= c + 1# just an increase

func get_entity_path(unit) -> String:
	match unit:
		"Tank Skeleton" : return "res://Entity/Unit/Shield Skeleton/Shield Skeleton.tscn"
		"Skeleton Archer" :  return "res://Entity/Unit/Skeleton Archer/Skeleton Archer.tscn"
		"Skeleton swordman" :  return "res://Entity/Unit/Sword Skeleton/Sword_Skeleton.tscn"
		"Tomb" :  return "res://Entity/Structure/Coffin/Coffin.tscn"
		"Wooden Wall" :  return "res://Entity/Structure/Wall/Wall.tscn"
		"Soul Turret" :  return "res://Entity/Structure/Wisp turret/Wisp turret.tscn"
		"Phantom" : return "res://Entity/Unit/Phantom/Phantom.tscn"
		"Mage Skeleton" : return "res://Entity/Unit/Mage Skeleton/Mage Skeleton.tscn"
		"Living Armor" : return "res://Entity/Unit/Living Wisp/Living_Wisp.tscn"
	return "Problem"

