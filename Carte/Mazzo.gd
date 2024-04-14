extends TextureButton

var DimensioneDeck = INF
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _gui_input(event):
	if Input.is_action_just_released("leftclick"):
		if DimensioneDeck > 0:
			DimensioneDeck = $'../..'._draw()
			if DimensioneDeck == 0:
				disabled = true
