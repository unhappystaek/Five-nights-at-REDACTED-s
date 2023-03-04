extends Node


# locations:

var FuzowLocation: String = "stage"
var LichuLocation: String = "stage"
var TerpilLocation: String = "stage"
var WierStage: float = 0

var _timer_Fuzow = null
var _timer_Terpil = null
var _timer_Lichu = null
var _timer_Wier = null

var Frand: int
var Wrand: int
var Trand: int
var Lrand: int


var isBlackout: bool = false

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

# cams: 1a - stage, 1b - dining, 7 - wc, 6 - kitchen, 5 - backstage, 1c - cave,
# 3 - closet, 2a - leftCorridor, 2b - leftDetector, 4a - rightCorridor, 4b - rightDetector

#doorLeft, doorRight

func _process(delta):
	isBlackout = get_parent().get_parent().isBlackout
	
func _on_Timer_Fuzow_timeout():
	if get_parent().FuzowLevel >= randi()%20+1 and isBlackout == false:
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
			pass
			#tbc
	
	
func _on_Timer_Wier_timeout():
	if get_parent().FuzowLevel >= randi()%20+1 and isBlackout == false:
		pass
	
	
func _on_Timer_Lichu_timeout():
	if get_parent().FuzowLevel >= randi()%20+1 and isBlackout == false:
		pass
	
	
func _on_Timer_Terpil_timeout():
	if get_parent().TerpilLevel >= randi()%20+1 and isBlackout == false:
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
	
	