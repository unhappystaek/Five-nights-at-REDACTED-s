extends Control



func _ready():
	$no.grab_focus()
	

func _on_yes_pressed():
	get_tree().change_scene("res://scenes/actual_scenes/Menu.tscn")


func _on_no_pressed():
	$".".visible = false



