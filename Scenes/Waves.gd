extends MyClass

# Set the scripted/default wave.
func _ready():
	
	var waves = [
		{"Sword_Skeleton":[8,5,6],"Ghost":3,"Shield_Skeleton":9},
		{"Archer_Skeleton":3, "Sword_Skeleton":8,"Ghost":4,"Shield_Skeleton":9} 
		
		
		]
	for wave in waves:# loop the wave
		spawn_wave(wave)  # start the N-Wave
	
	



