extends Control

#onready var night = SaveSystem.night

func _ready():
	get_node("/root/SaveSystem").loadValue("All", "night")
	$VBoxContainer/newGame.grab_focus()
	
	if SaveSystem.night == 1:
		$MarginContainer/nightLabel.text = "Night 1"
	elif SaveSystem.night == 2:
		$MarginContainer/nightLabel.text = "Night 2"
	elif SaveSystem.night == 3:
		$MarginContainer/nightLabel.text = "Night 3"
	elif SaveSystem.night == 4:
		$MarginContainer/nightLabel.text = "Night 4"
	elif SaveSystem.night == 5:
		$MarginContainer/nightLabel.text = "Night 5"
	elif SaveSystem.night == 6:
		$MarginContainer/nightLabel.text = "Night 6"
	elif SaveSystem.night == 7:
		$MarginContainer/nightLabel.text = "Night 7"


func _on_newGame_pressed():
	get_tree().change_scene("res://scenes/actuall_scenes/Night_endings/vierJumpscare.tscn")
	#if SaveSystem.night != 1:
	#	get_tree().change_scene("res://scenes/actuall_scenes/New_game.tscn")
	#else:
	#	get_tree().change_scene("res://scenes/actuall_scenes/Newspaper.tscn")

func _on_continue_pressed():
	if SaveSystem.night != 1:
		get_tree().change_scene("res://scenes/actuall_scenes/Office.tscn")
	else:
		get_tree().change_scene("res://scenes/actuall_scenes/Newspaper.tscn")

func _on_quit_pressed():
	get_tree().quit()
