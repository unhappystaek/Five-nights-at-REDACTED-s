extends Node2D

var _timer = null
var _timer2 = null
var animation: bool = false

func _ready():
	$AudioStreamPlayer.play()
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_timer_timeout")
	_timer.set_wait_time(2)
	_timer.set_one_shot(true) # Make sure it loops
	_timer.start()
	
func _process(delta):
	if animation == true and $hour.rect_position.y > 110:
		$hour.rect_position.y -= 1

func _on_timer_timeout():
	animation = true
	_timer2 = Timer.new()
	add_child(_timer2)

	_timer2.connect("timeout", self, "_on_timer2_timeout")
	_timer2.set_wait_time(9.0)
	_timer2.set_one_shot(true) # Make sure it loops
	_timer2.start()

	
func _on_timer2_timeout():
	if SaveSystem.night == 5:
		get_tree().change_scene("res://scenes/actuall_scenes/Night_endings/night5end.tscn")
	else:
		if SaveSystem.night != 7:
			SaveSystem.night += 1
			get_node("/root/SaveSystem").saveValue("All", "night")
			get_tree().change_scene("res://scenes/actuall_scenes/Menu.tscn")
		else:
			get_tree().change_scene("res://scenes/actuall_scenes/Menu.tscn")
