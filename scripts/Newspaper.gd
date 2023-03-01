extends Control

var _timer = null

func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(3.0)
	_timer.set_one_shot(true) # Make sure it loops
	_timer.start()


func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/actuall_scenes/Office.tscn")
