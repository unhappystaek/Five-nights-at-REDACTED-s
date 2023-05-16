extends Node

var _timer = null
var num: int

func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
func _on_Timer_timeout():
	num = randi()%100+1
	if get_parent().phoneTalking == false:
		if num == 44:
			$random.play("funny")
		elif num == 32:
			$random.play("gay")
		elif num == 71:
			$random.play("pipe")
		elif num == 4:
			$random.play("shit")
		elif num == 15:
			$random.play("flicker")
		elif num == 26:
			$random.play("red_face")
