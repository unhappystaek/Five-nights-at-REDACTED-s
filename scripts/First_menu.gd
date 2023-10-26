extends Control

var firstMenuVisible: bool = false
var escMenuVisible: bool = false
var settingsMenuVisible: bool = false

func _ready():
	pass # Replace with function body.

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
