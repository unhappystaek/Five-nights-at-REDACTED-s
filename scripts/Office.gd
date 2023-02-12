extends Spatial

var power: float = 99
var power_display: int = 99
var power_usage_math: float = 1
var power_usage: float = 1
var _timer = null


func _process(delta):
	power_usage = 1
	if ($Room/Door_left.doorOpen == false):
		power_usage += 1
	if ($Room/Door_right.doorOpen == false):
		power_usage += 1
		
	power_display = power_usage_math
	

func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()


func _on_Timer_timeout():
	if (power_usage == 1):
		power -= 0.141
	elif (power_usage == 2):
		power -= 0.235
	elif (power_usage == 3):
		power -= 0.341
	elif (power_usage == 4):
		power -= 0.447
	elif (power_usage == 5):
		power -= 0.553
		
	power_display = stepify(power, 1)
	
	
	
