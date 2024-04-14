extends Node2D


class_name Spawner

@export var Spawn_location : Node

var Waves = [
	{
	"Scheletro Spada":[Vector2(10,10),Vector2(10,10),Vector2(10,10)],
	"Fantasma":[Vector2(10,10)],
	"Scheletro Arco":[Vector2(10,10)]
	},
	{
		"Scheletro Arco":[Vector2(10,10)], 
		"Scheletro Spada":[Vector2(10,10)],
		"Ghost":[Vector2(10,10)],
		"Scheletro Scudo":[Vector2(10,10)]
	}
	]

# Called when the node enters the scene tree for the first time.

var current_wave : int = 0

func next_wave():
	current_wave += 1
	Spawn_wave(current_wave)

func Spawn_wave(wave : int): #enemy has  EnemyTipe -> point
	var c = 0 # simply counter
	var enemy_type = Waves[wave].keys() # take all the type  of the enemy and put them to an array
	#var spawnpoint = enemyspawn.values()# take all the spawnpoint and put them to an array
	while c < Waves[wave].size(): # while the enemy exist
		var quantity_of_enemy = Waves[wave][c] # take the time that you must spawn the specific enemy
		var i = 0 # simply counter
		while i < quantity_of_enemy.size(): # how many time the same enemy must be spawned
			var enemy_scene = load(get_entity_path(enemy_type[c])) #Load the specific enemy
			var enemy = enemy_scene.instantiate()# instantiate it
			enemy.position = Waves[wave][c][i] #set the position
			Spawn_location.add_child(enemy) # spawn the enemy_type at the spawnpoint
			i= i + 1 # just an increase
		c= c + 1# just an increase

func get_entity_path(unit):
	
	match unit:
		"Scheletro Schudo" : "res://Entity/Unit/Shield Skeleton/Shield Skeleton.tscn"
		"Scheletro Arco" : "res://Entity/Unit/Skeleton Archer/Skeleton Archer.tscn"
		"Scheletro Spada" : "res://Entity/Unit/Sword Skeleton/Sword_Skeleton.tscn"
		"Coffin" : "res://Entity/Structure/Coffin/Coffin.tscn"
		"Wall" : "res://Entity/Structure/Wall/Wall.tscn"
		"Torretta Scheletro" : "res://Entity/Structure/Wisp turret/Wisp turret.tscn"

