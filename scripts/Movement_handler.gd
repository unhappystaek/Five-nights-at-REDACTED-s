extends Node


var rand_generate = RandomNumberGenerator.new()

var FuzowLocation: String = "stage"
var LichuLocation: String = "stage"
var TerpilLocation: String = "stage"
var WierStage: float = 0

var _timer_Fuzow = null
var _timer_Terpil = null
var _timer_Lichu = null
var _timer_Wier = null

var _timer_Fuzow_ready = null
var _timer_Terpil_ready = null
var _timer_Wier_ready = null
var _timer_Lichu_move_ready = null
var _timer_Lichu_ready = null

var Frand: int
var Wrand: int
var Trand: int
var Lrand: int

var lichuCountdown: float = 15
var lichuMoveReady: bool = false
var lichuCamping: bool = false

var time = 0
var timer_on = false
var timer_goal: float

var isBlackout: bool = false

var cam_up: bool = false setget set_cam_up
var Wier_locked: bool = false 

func set_cam_up(val):
	cam_up = val
	if cam_up == true:
		Wier_locked = true
		time = 0
		timer_on = false
	if cam_up == false:
		timer_on = true
		timer_goal = rand_generate.randf_range(0.83, 16.67)

func _ready():
	_timer_Fuzow = Timer.new()
	add_child(_timer_Fuzow)

	_timer_Fuzow.connect("timeout", self, "_on_Timer_Fuzow_timeout")
	_timer_Fuzow.set_wait_time(4.97)
	_timer_Fuzow.set_one_shot(false) # Make sure it loops
	_timer_Fuzow.start()
	
	_timer_Lichu = Timer.new()
	add_child(_timer_Lichu)

	_timer_Lichu.connect("timeout", self, "_on_Timer_Lichu_timeout")
	_timer_Lichu.set_wait_time(3.02)
	_timer_Lichu.set_one_shot(false) # Make sure it loops
	_timer_Lichu.start()
	
	
	_timer_Terpil = Timer.new()
	add_child(_timer_Terpil)

	_timer_Terpil.connect("timeout", self, "_on_Timer_Terpil_timeout")
	_timer_Terpil.set_wait_time(4.98)
	_timer_Terpil.set_one_shot(false) # Make sure it loops
	_timer_Terpil.start()
	
	_timer_Wier = Timer.new()
	add_child(_timer_Wier)

	_timer_Wier.connect("timeout", self, "_on_Timer_Wier_timeout")
	_timer_Wier.set_wait_time(5.01)
	_timer_Wier.set_one_shot(false) # Make sure it loops
	_timer_Wier.start()
	
	_timer_Lichu_ready = Timer.new()
	add_child(_timer_Lichu_ready)
	
	_timer_Lichu_ready.connect("timeout", self, "_on_Timer_Lichu_ready_timeout")
	_timer_Lichu_ready.set_wait_time(1)
	_timer_Lichu_ready.set_one_shot(false) # Make sure it loops
	_timer_Lichu_ready.start()

# cams: 1a - stage, 1b - dining, 7 - wc, 6 - kitchen, 5 - backstage, 1c - cave,
# 3 - closet, 2a - leftCorridor, 2b - leftDetector, 4a - rightCorridor, 4b - rightDetector

#doorLeft, doorRight, ready (to jumpscare)

func _process(delta):
	isBlackout = get_parent().get_parent().isBlackout
	if(timer_on):
		time += delta
	if time >= timer_goal:
		Wier_locked = false
		
	if get_parent().get_parent().get_child(0).get_child(0).get_child(0).get_child(7).wierWorking == true:
		_timer_Wier_ready.stop()
		
	if lichuMoveReady == true and cam_up == false:
		lichuMoveReady = false
		lichu_move()
		
	if lichuCamping == true and isBlackout == false and get_parent().get_parent().get_child(0).get_child(0).get_child(0).get_child(7).lastCam != "4b" :
		lichuCamping = false
		if get_parent().get_parent().get_child(0).get_child(3).doorOpen == true:
			LichuLocation = "ready"
		else:
			LichuLocation = "rightDetector"
	
	
func _on_Timer_Fuzow_timeout():
	Frand = randi()%20+1
	if get_parent().FuzowLevel >= Frand and isBlackout == false:
		if FuzowLocation == "stage":
			Frand = randi()%2+1
			if Frand == 2:
				FuzowLocation = "dining"
			else:
				FuzowLocation = "backstage"
		elif FuzowLocation == "dining":
			Frand = randi()%2+1
			if Frand == 2:
				FuzowLocation = "leftCorridor"
			else:
				FuzowLocation = "backstage"
		elif FuzowLocation == "backstage":
			Frand = randi()%2+1
			if Frand == 2:
				FuzowLocation = "leftCorridor"
			else:
				FuzowLocation = "dining"
		elif FuzowLocation == "leftCorridor":
			Frand = randi()%2+1
			if Frand == 2:
				FuzowLocation = "leftDetector"
			else:
				FuzowLocation = "closet"
		elif FuzowLocation == "closet":
			Frand = randi()%2+1
			if Frand == 2:
				FuzowLocation = "doorLeft"
			else:
				FuzowLocation = "leftCorridor"
		elif FuzowLocation == "leftDetector":
			Frand = randi()%2+1
			if Frand == 2:
				FuzowLocation = "doorLeft"
			else:
				FuzowLocation = "closet"
		elif FuzowLocation == "doorLeft":
			if get_parent().get_parent().get_child(0).get_child(4).doorOpen == true:
				FuzowLocation = "ready"
				if get_parent().get_parent().get_child(0).get_child(0).cam_up == true:
					_timer_Fuzow_ready = Timer.new()
					add_child(_timer_Fuzow_ready)
					
					_timer_Fuzow_ready.connect("timeout", self, "_on_Timer_Fuzow_ready_timeout")
					_timer_Fuzow_ready.set_wait_time(20)
					_timer_Fuzow_ready.set_one_shot(true) # Make sure it loops
					_timer_Fuzow_ready.start()
			else:
				FuzowLocation = "dining"
	
	
func _on_Timer_Wier_timeout():
	Wrand = randi()%20+1
	if get_parent().WierLevel >= Wrand and isBlackout == false and Wier_locked == false and cam_up == false:
		if WierStage < 3:
			WierStage += 1
		elif WierStage == 3:
			_timer_Wier_ready = Timer.new()
			add_child(_timer_Wier_ready)
			
			_timer_Wier_ready.connect("timeout", self, "_on_Timer_Wier_ready_timeout")
			_timer_Wier_ready.set_wait_time(25)
			_timer_Wier_ready.set_one_shot(true) # Make sure it loops
			_timer_Wier_ready.start()
	
	
func _on_Timer_Lichu_timeout():
	if LichuLocation != "rightDetector":
		Lrand = randi()%20+1
		if get_parent().LichuLevel >= Lrand and isBlackout == false and cam_up == false:
			lichuCountdown = 16.67 - ((100*get_parent().LichuLevel)/60)
			if lichuCountdown > 0:
				_timer_Lichu_move_ready = Timer.new()
				add_child(_timer_Lichu_move_ready)
				
				_timer_Lichu_move_ready.connect("timeout", self, "_on_Timer_Lichu_move_ready_timeout")
				_timer_Lichu_move_ready.set_wait_time(lichuCountdown)
				_timer_Lichu_move_ready.set_one_shot(true) # Make sure it loops
				_timer_Lichu_move_ready.start()
			else:
				_on_Timer_Lichu_move_ready_timeout()
	else:
		Lrand = randi()%20+1
		if get_parent().LichuLevel >= Lrand and isBlackout == false:
			lichuCamping = true
	
	
func _on_Timer_Lichu_move_ready_timeout():
	lichuMoveReady = true
	
	
func lichu_move():
	if LichuLocation == "stage":
		LichuLocation = "dining"
	elif LichuLocation == "dining":
		LichuLocation = "wc"
	elif LichuLocation == "wc":
		LichuLocation = "kitchen"
	elif LichuLocation == "kitchen":
		LichuLocation = "rightCorridor"
	elif LichuLocation == "rightCorridor":
		LichuLocation = "rightDetector"
	
	
func _on_Timer_Lichu_ready_timeout():
	if randi()%5+1 == 3 and LichuLocation == "ready":
		get_tree().change_scene("res://scenes/actual_scenes/Night_endings/lichuJumpscare.tscn")
	
	
func _on_Timer_Terpil_timeout():
	Trand = randi()%20+1
	if get_parent().TerpilLevel >= Trand and isBlackout == false:
		if TerpilLocation == "stage":
			TerpilLocation = "dining"
		elif TerpilLocation == "dining":
			Trand = randi()%2+1
			if Trand == 2:
				TerpilLocation = "kitchen"
			elif Trand == 1:
				TerpilLocation = "wc"
		elif TerpilLocation == "wc":
			Trand = randi()%2+1
			if Trand == 2:
				TerpilLocation = "rightCorridor"
			elif Trand == 1:
				TerpilLocation = "kitchen"
		elif TerpilLocation == "kitchen":
			Trand = randi()%2+1
			if Trand == 2:
				TerpilLocation = "rightCorridor"
			elif Trand == 1:
				TerpilLocation = "wc"
		elif TerpilLocation == "rightCorridor":
			Trand = randi()%2+1
			if Trand == 2:
				TerpilLocation = "rightDetector"
			elif Trand == 1:
				TerpilLocation = "dining"
		elif TerpilLocation == "rightDetector":
			Trand = randi()%2+1
			if Trand == 2:
				TerpilLocation = "rightCorridor"
			elif Trand == 1:
				TerpilLocation = "doorRight"
		elif TerpilLocation == "doorRight":
			if get_parent().get_parent().get_child(0).get_child(3).doorOpen == true:
				TerpilLocation = "ready"
				if get_parent().get_parent().get_child(0).get_child(0).cam_up == true:
					_timer_Terpil_ready = Timer.new()
					add_child(_timer_Terpil_ready)
					
					_timer_Terpil_ready.connect("timeout", self, "_on_Timer_Terpil_ready_timeout")
					_timer_Terpil_ready.set_wait_time(20)
					_timer_Terpil_ready.set_one_shot(true) # Make sure it loops
					_timer_Terpil_ready.start()
			else:
				TerpilLocation = "dining"
	
	
func _on_Timer_Fuzow_ready_timeout():
	if isBlackout == false:
		get_tree().change_scene("res://scenes/actual_scenes/Night_endings/fuzowJumpscare.tscn")
	
	
func _on_Timer_Terpil_ready_timeout():
	if isBlackout == false:
		get_tree().change_scene("res://scenes/actual_scenes/Night_endings/terpilJumpscare.tscn")
	
	
func _on_Timer_Wier_ready_timeout():
	if WierStage == 3:
		get_parent().get_parent().get_child(0).get_child(0).get_child(0).get_child(7).WierActivate()
