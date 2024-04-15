extends Node

#informazioni unita' = [tipo,costo,hp,immagine,descrizione,scena,scena_unita]
const DATA = {

	'Skeleton swordman' :
		['',1, 7, "res://Carte/Sprite Carte/Carta Spada.png", "","res://Carte/Carta.tscn","res://Entity/Unit/Sword Skeleton/Sword_Skeleton.tscn"],
	'Skeleton Archer' :
		["",2, 3,"res://Carte/Sprite Carte/Carta Arco.png", "","res://Carte/Carta.tscn","res://Entity/Unit/Skeleton Archer/Skeleton Archer.tscn"],
	'Tank Skeleton' :
		['',1, 13, "res://Carte/Sprite Carte/Carta Scudo.png", "","res://Carte/Carta.tscn","res://Entity/Unit/Shield Skeleton/Shield Skeleton.tscn"],
	'Phantom':
		['',3, 4, "res://Carte/Sprite Carte/Carta Phantom.png",'',"res://Carte/carta.tscn",],
	'Ghostly Armor':
		['',7, 50, "res://Carte/Sprite Carte/Carta Bullone.png",'',"res://Carte/carta.tscn",],
	'Sorcerer':
		['',3, 5, "res://Carte/Sprite Carte/Carta Sorcerer.png",'',"res://Carte/carta.tscn",],
	'Heal' :
		['',3, 0, "res://Carte/Sprite Carte/Carta Heal.png", 'Restores 5hp to yourself',"res://Carte/carta.tscn", ''],
	'Soul Piercer' :
		['',3, 0, "res://Carte/Sprite Carte/Carta Spear.png", 'Inflicts 5 damage to the enemy commander',"res://Carte/Carta.gd",''],
	'Tomb' :
		['',3, 3, "res://Carte/Sprite Carte/Coffin.png", 'It lasts until it has hp remaining. Loses 1hp per turn, summon up to 4 skeleton swordman each tun, 1 every 15s',"res://Carte/carta.tscn","res://Entity/Structure/Coffin/Coffin.tscn",],
	'Wooden Wall' :
		['',1, 20, "res://Carte/Sprite Carte/wall.png", 'Lasts until it gets destroyed. Nothing particular, blocks enemies and damage, what did you expect.', "res://Carte/carta.tscn","res://Entity/Structure/Wall/Wall.tscn"],
	'Soul Turret' :
		['',2, 10, "res://Carte/Sprite Carte/Soulturret.png", 'Lasts until it gets destroyed. Shoots magical fire as projectiles. Can hit ghosts.', "res://Carte/carta.tscn","res://Entity/Structure/Wisp turret/Wisp turret.tscn"]
		

}


