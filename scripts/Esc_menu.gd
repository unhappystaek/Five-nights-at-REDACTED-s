extends Control

var escMenuVisible: bool = false

func _ready():
	$no.grab_focus()
	

func _on_yes_pressed():
	get_tree().change_scene("res://scenes/actuall_scenes/Menu.tscn")


func _on_no_pressed():
	if escMenuVisible == true:
		escMenuVisible = false
		$".".visible = false
		visible = false


func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		if escMenuVisible == false:
			escMenuVisible = true
			$".".visible = true
		
	
