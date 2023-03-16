extends Spatial

var power: float = 99
var power_display: int = 99
var power_usage_math: float = 1
var power_usage: float = 1
var _timer = null
var _timer_hour = null
var hour: float = 0
var isBlackout: bool = false


func _process(delta):
	
	power_usage = 1
	if ($Room/Door_left.doorOpen == false):
		power_usage += 1
	if ($Room/Door_right.doorOpen == false):
		power_usage += 1
	if ($Room/main_camera.cam_up == true):
		power_usage += 1
	if ($Room/Door_left.lightOn == true):
		power_usage +=1
		
	
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
	$Room/Front_area/Fan/Buzzing_sound.playing = true
	
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
			power -= 0.15
		elif (power_usage == 2):
			power -= 0.25
		elif (power_usage == 3):
			power -= 0.35
		elif (power_usage == 4):
			power -= 0.45
		elif (power_usage == 5):
			power -= 0.55
	
	$Room/main_camera/UI/Percent_label.text = str(power_display) + "%"
	
	if power_display == 0 and isBlackout == false:
		$Room/Front_area.is_energy = false
		$Room/Front_area/Desk_lamp/Bulb_light.hide()
		$Room/Front_area/Desk_lamp/Lamp_light.hide()
		$Room/Main_light.hide()
		
		$Room/Door_left.ready = false
		$Room/Door_left.doorOpen = true
		$Room/Door_left/Door_open_left.play("Door_open_left")
			
		$Room/Door_right.ready = false
		$Room/Door_right.doorOpen = true
		$Room/Door_right/Door_open_right.play("Door_open_right")
		
		$Room/Door_left.isEnergy = false
		$Room/Door_right.isEnergy = false
		
		$Room/Blackout/Blackout_animation.play("Blackout_animation")
		isBlackout = true
		
		$Room/Front_area/Fan/Buzzing_sound.playing = false
	
func _on_Timer_hour_timeout():
	if (hour !=6):
		hour +=1
	if (hour == 0):
		$Room/main_camera/UI/Time_label.text = "12 PM"
	else:
		$Room/main_camera/UI/Time_label.text = str(hour) + " AM"
	



