extends Node

var night = 5


var save_path = 'res://config.cfg'
var config = ConfigFile.new()
var load_response = 'config.load(save_path)'

func _ready():
	pass # Replace with function body.
	
func saveValue(section, key):
	config.set_value(section, key, night)
	config.save(save_path)
	
func loadValue(section, key):
	night = config.get_value(section, key, night)
	
func reset(section, key):
	night = 1
	saveValue(section, key)
	get_tree().change_scene("res://scenes/actuall_scenes/Menu.tscn")

