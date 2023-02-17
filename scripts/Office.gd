extends Spatial

var power: float = 99
var power_display: int = 99
var power_usage_math: float = 1
var power_usage: float = 1
var _timer = null
var _timer_hour = null
var hour: float = 0


func _process(delta):
	
	power_usage = 1
	if ($Room/Door_left.doorOpen == false):
		power_usage += 1
	if ($Room/Door_right.doorOpen == false):
		power_usage += 1
	if ($Room/main_camera.cam_up == true):
		power_usage += 1
	
	if (power_usage == 1):
		$Room/main_camera/UI/Control/ColorRect2.color = Color(0, 0, 0, 0)
		$Room/main_camera/UI/Control/ColorRect3.color = Color(0, 0, 0, 0)
		$Room/main_camera/UI/Control/ColorRect4.color = Color(0, 0, 0, 0)
		$Room/main_camera/UI/Control/ColorRect5.color = Color(0, 0, 0, 0)
	elif (power_usage == 2):
		$Room/main_camera/UI/Control/ColorRect2.color = Color(0.521569, 1, 0)
		$Room/main_camera/UI/Control/ColorRect3.color = Color(0, 0, 0, 0)
		$Room/main_camera/UI/Control/ColorRect4.color = Color(0, 0, 0, 0)
		$Room/main_camera/UI/Control/ColorRect5.color = Color(0, 0, 0, 0)
		
	elif (power_usage == 3):
		$Room/main_camera/UI/Control/ColorRect2.color = Color(0.521569, 1, 0)
		$Room/main_camera/UI/Control/ColorRect3.color = Color(0.862745, 0.807843, 0)
		$Room/main_camera/UI/Control/ColorRect4.color = Color(0, 0, 0, 0)
		$Room/main_camera/UI/Control/ColorRect5.color = Color(0, 0, 0, 0)
	elif (power_usage == 4):
		$Room/main_camera/UI/Control/ColorRect2.color = Color(0.521569, 1, 0)
		$Room/main_camera/UI/Control/ColorRect3.color = Color(0.862745, 0.807843, 0)
		$Room/main_camera/UI/Control/ColorRect4.color = Color(0.823529, 0.270588, 0)
		$Room/main_camera/UI/Control/ColorRect5.color = Color(0, 0, 0, 0)
	elif (power_usage == 2):
		$Room/main_camera/UI/Control/ColorRect2.color = Color(0.521569, 1, 0)
		$Room/main_camera/UI/Control/ColorRect3.color = Color(0.862745, 0.807843, 0)
		$Room/main_camera/UI/Control/ColorRect4.color = Color(0.823529, 0.270588, 0)
		$Room/main_camera/UI/Control/ColorRect5.color = Color(0.823529, 0, 0)
		
	power_display = power
	
	
	

func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
	_timer_hour = Timer.new()
	add_child(_timer_hour)

	_timer_hour.connect("timeout", self, "_on_Timer_hour_timeout")
	_timer_hour.set_wait_time(85.0)
	_timer_hour.set_one_shot(false) # Make sure it loops
	_timer_hour.start()
	
	


func _on_Timer_timeout():
	power_display = stepify(power, 1)
	if (power_display != 0):
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
	
	$Room/main_camera/UI/Percent_label.text = str(power_display) + "%"
	
	if power_display == 0:
		$Room/Front_area.is_energy = false
		$Room/Front_area/Desk_lamp/Bulb_light.hide()
		$Room/Front_area/Desk_lamp/Lamp_light.hide()
		$Room/Main_light.hide()
	
func _on_Timer_hour_timeout():
	if (hour !=6):
		hour +=1
	if (hour == 0):
		$Room/main_camera/UI/Time_label.text = "12 PM"
	else:
		$Room/main_camera/UI/Time_label.text = str(hour) + " AM"
	
