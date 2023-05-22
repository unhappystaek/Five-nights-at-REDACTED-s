extends Control

var console_on: bool = false

func _input(event):
	if Input.is_key_pressed(68) and Input.is_key_pressed(69) and Input.is_key_pressed(66):
		$".".visible = true
		console_on = true

func _on_gold_pressed():
	get_parent().get_child(3).Gold()


func _on_blackout_pressed():
	get_parent().power = 0


func _on_Jumpscares_console_pressed():
	pass # Replace with function body.


func _on_kill_pressed():
	get_tree().quit()


func _on_hour_up_pressed():
	if get_parent().hour == 5:
		get_tree().change_scene("res://scenes/actual_scenes/Night_endings/nightEnd.tscn")
	get_parent().hour += 1
	get_parent()._update_hour()


func _on_hour_down_pressed():
	if get_parent().hour != 0:
		get_parent().hour -= 1
	get_parent()._update_hour()


func _on_day_up_pressed():
	if SaveSystem.night != 7 :
		SaveSystem.night += 1
		get_parent().get_child(1).n = SaveSystem.night
		get_parent().get_child(1)._on_Timer_hour_timeout()


func _on_day_down_pressed():
	if SaveSystem.night != 1 :
		SaveSystem.night -= 1
		get_parent().get_child(1).n = SaveSystem.night
		get_parent().get_child(1)._on_Timer_hour_timeout()
