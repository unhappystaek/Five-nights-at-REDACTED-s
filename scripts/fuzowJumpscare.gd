extends Node2D

var _timer = null
var _timer2 = null

func _ready():
	$VideoPlayer.play()
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_timer_timeout")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(true) # Make sure it loops
	_timer.start()
	$JumpSound.play()
	

func _on_timer_timeout():
	_timer2 = Timer.new()
	add_child(_timer2)

	_timer2.connect("timeout", self, "_on_timer2_timeout")
	_timer2.set_wait_time(2.5)
	_timer2.set_one_shot(true) # Make sure it loops
	_timer2.start()
	$color.visible = true
	$effect.visible = true
	$BuzzSound.play()
	#$JumpSound.stop()
	
func _on_timer2_timeout():
	get_tree().change_scene("res://scenes/actuall_scenes/Menu.tscn")

