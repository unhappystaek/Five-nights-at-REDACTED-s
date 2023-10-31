extends Control

var firstMenuVisible: bool = false
var escMenuVisible: bool = false
var settingsMenuVisible: bool = false

func _ready():
	$Exit_button.grab_focus()

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		if get_parent().get_child(4).console_on == false:
			if firstMenuVisible == false and escMenuVisible == false and settingsMenuVisible == false:
				firstMenuVisible = true
				$".".visible = true
			else:
				firstMenuVisible = false
				settingsMenuVisible = false
				escMenuVisible = false
				$".".visible = false
				get_parent().get_child(2).visible = false
				get_parent().get_child(6).visible = false
				
		else:
			get_parent().get_child(4).visible = false
			get_parent().get_child(4).console_on = false


func _on_Exit_button_pressed():
	get_parent().get_child(2).visible = true
	$".".visible = false


func _on_Settings_button_pressed():
	get_parent().get_child(6).visible = true
	$".".visible = false


func _on_Back_pressed():
	$".".visible = true
	get_parent().get_child(6).visible = false
