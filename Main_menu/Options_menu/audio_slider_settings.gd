extends Control



@onready var audio_name_master = $HBoxContainer/Audio_name_master as Label
@onready var audio_num_master = $HBoxContainer/Audio_num_master as Label
@onready var h_slider = $HBoxContainer/HSlider as HSlider

@export_enum("Master", "Music", "Sfx") var bus_name : String

var bus_index : int = 0 

func _ready():
	h_slider.value_changed.connect(on_value_changed)
	get_bus_name_by_index()
	set_name_label_test()
	set_slider_value()
	
	
func set_name_label_test() -> void:
	audio_name_master.text = str(bus_name) + " Volume"

func set_audio_num_label_test() -> void:
	audio_num_master.text = str(h_slider.value * 100) + "%"
	

func get_bus_name_by_index() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)

func set_slider_value() -> void:
	h_slider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	
	set_audio_num_label_test()
	
	
func on_value_changed(value : float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	set_audio_num_label_test()
 

