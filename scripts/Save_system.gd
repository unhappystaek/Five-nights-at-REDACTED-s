extends Node

var night = 1

var save_path = 'user://config.cfg'
var config = ConfigFile.new()
var load_response = config.load(save_path)

func _ready():
	if config.get_value("All", "night") != null:
		loadValue("All", "night")
		print_debug(night)
	
func saveValue(section, key):
	config.set_value(section, key, night)
	config.save(save_path)
	
func loadValue(section, key):
	print_debug(config)
	night = config.get_value(section, key)
	
func reset(section, key):
	night = 1
	saveValue(section, key)
	get_tree().change_scene("res://scenes/actual_scenes/Menu.tscn")

