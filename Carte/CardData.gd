extends Node

#informazioni unita' = [tipo,costo,hp,immagine,descrizione,scena,scena_unita]
const DATA = {

	'Skeleton swordman' :
		['',1, 7, "res://Carte/Sprite Carte/Carta Spada.png", "Once in noble battles... nothing, he is just a skeleton, the melee one (he has a sword, of course), what did you expect?","res://Carte/Carta.tscn","res://Entity/Unit/Sword Skeleton/Sword_Skeleton.tscn"],
	'Skeleton Archer' :
		["",2, 3,"res://Carte/Sprite Carte/Carta Arco.png", "Litterally the melee one but he is weaker and has a bow.","res://Carte/Carta.tscn","res://Entity/Unit/Skeleton Archer/Skeleton Archer.tscn"],
	'Tank Skeleton' :
		['',1, 13, "res://Carte/Sprite Carte/Carta Scudo.png", "The best out of the 3 stupid Skeletons, the elitè among the weaklings... kidding, he uses a shield, he is just scared of everything.","res://Carte/Carta.tscn","res://Entity/Unit/Shield Skeleton/Shield Skeleton.tscn"],
	'Phantom':
		['',3, 4, "res://Carte/Sprite Carte/Carta Phantom.png",'He has fangs because he thought it was "edgy", still gets one shotted by almost everything.',"res://Carte/carta.tscn",],
	'Living Armor' :
		['',7, 50, "res://Carte/Sprite Carte/Carta Bullone.png",'The real deal, the Boss among the army of useless undead, the best tank, the best frontline and the best unti among them, except he takes double the emotional damage because his head is small.
Do not make fun of his name, he is sensitive about the topic...',"res://Carte/carta.tscn",],
	'Sorcerer':
		['',3, 5, "res://Carte/Sprite Carte/Carta Sorcerer.png",'Meant to be the main character, born to be a stupid minion..., literally.',"res://Carte/carta.tscn",],
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


