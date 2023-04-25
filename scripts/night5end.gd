extends Node2D

var _timer = null

func _ready():
	$hurray.play()
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_timer_timeout")
	_timer.set_wait_time(17)
	_timer.set_one_shot(true) # Make sure it loops
	_timer.start()
	
func _on_timer_timeout():
	if SaveSystem.night != 7:
		SaveSystem.night += 1
		get_tree().change_scene("res://scenes/actuall_scenes/Menu.tscn")
	else: 
		get_tree().change_scene("res://scenes/actuall_scenes/Menu.tscn")
