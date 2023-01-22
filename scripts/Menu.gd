extends Control






func _ready():
	get_node("/root/SaveSystem").loadValue("All", "night")
	$VBoxContainer/newGame.grab_focus()



func _on_newGame_pressed():
	pass # Replace with function body.


func _on_continue_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
