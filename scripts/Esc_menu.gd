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
	if Input.is_action_just_pressed("ui_cancel"):
		if escMenuVisible == false:
			escMenuVisible = true
			$".".visible = true
		else:
			escMenuVisible = false
			$".".visible = false
			visible = false
