extends Node2D

var _timer = null
var _timer_e = null
var _timer_fred = null
var state: String = "black"
var working: bool = true

func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_timer_timeout")
	_timer.set_wait_time(0.13)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
	_timer_e = Timer.new()
	add_child(_timer_e)

	_timer_e.connect("timeout", self, "_on_timer_e_timeout")
	_timer_e.set_wait_time(1)
	_timer_e.set_one_shot(false) # Make sure it loops
	_timer_e.start()

func _on_timer_timeout():
	if working == true:
		if state == "black":
			state = "red"
			$black.visible = false
			$red.visible = true
		elif state == "red":
			state = "bon"
			$red.visible = false
			$bon.visible = true
		elif state == "bon":
			state = "squid"
			$squid.visible = true
			$bon.visible = false
		elif state == "squid":
			state = "bon"
			$squid.visible = false
			$bon.visible = true
		


func _on_timer_e_timeout():
	working = false
	$black.visible = false
	$red.visible = false
	$squid.visible = false
	$bon.visible = false
	$fred.visible = true
	
	_timer_fred = Timer.new()
	add_child(_timer_fred)

	_timer_fred.connect("timeout", self, "_on_timer_fred_timeout")
	_timer_fred.set_wait_time(4.0)
	_timer_fred.set_one_shot(false) # Make sure it loops
	_timer_fred.start()
	
func _on_timer_fred_timeout():
	get_tree().change_scene("res://scenes/actual_scenes/Menu.tscn")
	
