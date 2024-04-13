extends Node

#riferimento all'enemy spawner
#var ES : EnemySpawner = ref
#riferimento al mazzo 
#var Mazzo : Mazzo = ref

var turno : bool = 0 : #0 per giocatore, 1 per nemico
	set(nturno):
		if turno:
			pass
		else:
			pass
		turno = nturno
	get:
		return turno

var fase : bool = 0 : #0 per preparazione, 1 per comabttimento
	set(nfase): prossima_fase(nfase)
	get:
		return turno

func prossimo_turno():
	turno = !turno

func prossima_fase(nfase):
	if !fase:
		prossimo_turno()
	if fase:
		#fai partire le entita
		#get_tree().call_group("Entita","Start")
		#impedisci al giocatore di giocare carte
		#Mazzo.lock()
		pass
	else:
		#rimuovi le unita non persistenti che rimangono
		#get_tree().call_group("Entita","Kill")
		#
		pass
	fase = nfase 
