extends Spatial

var power: float = 99
var power_display: int = 99
var power_usage_math: float = 1
var power_usage: float = 1
var _timer = null
var _timer_hour = null
var _timer_blackout = null
var _timer_song = null
var _timer_end = null
var hour: float = 0
var isBlackout: bool = false
var blackoutCountdown: int
var songCountdown: int


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
	if ($Room/Door_right.lightOn == true):
		power_usage +=1
	
	if (power_usage == 1):
		$Room/main_camera/UI/Control/ColorRect2.visible = false
		$Room/main_camera/UI/Control/ColorRect3.visible = false
		$Room/main_camera/UI/Control/ColorRect4.visible = false
	elif (power_usage == 2):
		$Room/main_camera/UI/Control/ColorRect2.visible = true
		$Room/main_camera/UI/Control/ColorRect3.visible = false
		$Room/main_camera/UI/Control/ColorRect4.visible = false
	elif (power_usage == 3):
		$Room/main_camera/UI/Control/ColorRect2.visible = true
		$Room/main_camera/UI/Control/ColorRect3.visible = true
		$Room/main_camera/UI/Control/ColorRect4.visible = false
	elif (power_usage == 4):
		$Room/main_camera/UI/Control/ColorRect2.visible = true
		$Room/main_camera/UI/Control/ColorRect3.visible = true
		$Room/main_camera/UI/Control/ColorRect4.visible = true

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
	
	if (hour == 0):
		$Room/main_camera/UI/Time_label.text = "12 PM"
	else:
		$Room/main_camera/UI/Time_label.text = str(hour) + " AM"
	
func _on_Timer_timeout():
	power_display = stepify(power, 1)
	if (power_display != 0):
		if (power_usage == 1):
			power -= 0.08
		elif (power_usage == 2):
			power -= 0.17
		elif (power_usage == 3):
			power -= 0.28
		elif (power_usage == 4):
			power -= 0.45
	
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
		blackoutCountdown = randi()%10+10
		_timer_blackout = Timer.new()
		add_child(_timer_blackout)
		
		_timer_blackout.connect("timeout", self, "_on_timer_blackout_timeout")
		_timer_blackout.set_wait_time(blackoutCountdown)
		_timer_blackout.set_one_shot(true) # Make sure it loops
		_timer_blackout.start()
		
		$Room/Front_area/Fan/Buzzing_sound.playing = false
	
func _on_Timer_hour_timeout():
	if (hour !=5):
		hour +=1
	elif hour == 5:
		get_tree().change_scene("res://scenes/actual_scenes/Night_endings/nightEnd.tscn")
	if (hour == 0):
		$Room/main_camera/UI/Time_label.text = "12 PM"
	else:
		$Room/main_camera/UI/Time_label.text = str(hour) + " AM"
	

func _on_timer_blackout_timeout():
	songCountdown = randi()%10+10
	$Room/Blackout/song_animation.play("song_animation")
	$Room/Blackout/OmniLight.visible = true
	_timer_song = Timer.new()
	add_child(_timer_song)
	
	_timer_song.connect("timeout", self, "_on_timer_song_timeout")
	_timer_song.set_wait_time(songCountdown)
	_timer_song.set_one_shot(true) # Make sure it loops
	_timer_song.start()

func _on_timer_song_timeout():
	$Room/Blackout/OmniLight.visible = false
	$Room/Blackout/song_animation.stop()
	$Room/Blackout/song.stop()
	$Room/Door_left/light_left/Door_texture_left_dark.visible = true
	$Room/Door_left/light_left/Door_texture_left_empty.visible = false
	$Room/Door_left/light_left/Door_texture_left_fuzow.visible = false
	_timer_end = Timer.new()
	add_child(_timer_end)
	
	_timer_end.connect("timeout", self, "_on_timer_end_timeout")
	_timer_end.set_wait_time(3)
	_timer_end.set_one_shot(true) # Make sure it loops
	_timer_end.start()
	
func _on_timer_end_timeout():
	get_tree().change_scene("res://scenes/actual_scenes/Night_endings/lichuJumpscare.tscn")
