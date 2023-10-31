extends Control

var master_bus = AudioServer.get_bus_index("Master")



func _ready():
	pass

func _on_Volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value)
	
	if value == -40:
		AudioServer.set_bus_mute(master_bus, true)
	else:
		AudioServer.set_bus_mute(master_bus, false)


func _on_Gamma_slider_value_changed(value):
	get_parent().get_child(0).get_child(0).environment.ambient_light_energy = value
