extends Control

#var night = 1

func _ready():
	$VBoxContainer/LineEdit.grab_focus()



func _on_Button_pressed():
	get_tree().change_scene("res://scenes/actual_scenes/Menu.tscn")


func _on_LineEdit_text_entered(new_text):
	if new_text == "kutas_kozla":
		get_node("/root/SaveSystem").reset("All", "night")
		
