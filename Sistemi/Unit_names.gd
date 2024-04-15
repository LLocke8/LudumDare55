extends Node


func get_entity_path(unit):
	match unit:
		"Scheletro Scudo" : "res://Entity/Unit/Shield Skeleton/Shield Skeleton.tscn"
		"Scheletro Arco" : "res://Entity/Unit/Skeleton Archer/Skeleton Archer.tscn"
		"Scheletro Spada" : "res://Entity/Unit/Sword Skeleton/Sword_Skeleton.tscn"
		"Coffin" : "res://Entity/Structure/Coffin/Coffin.tscn"
		"Wall" : "res://Entity/Structure/Wall/Wall.tscn"
		"Torretta Scheletro" : "res://Entity/Structure/Wisp turret/Wisp turret.tscn"
