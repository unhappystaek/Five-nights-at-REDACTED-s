extends Node

var FuzowLocation: String = "stage"
var LichuLocation: String = "stage"
var TerpilLocation: String = "stage"
var WierStage: float = 0

var FuzowLevel: float = 0
var LichuLevel: float = 0
var TerpilLevel: float = 0
var WierLevel: float = 0

var n

var _timer_hour = null

func _ready():
	if SaveSystem.night == 1:
		n = 1
	elif SaveSystem.night == 2:
		n = 2
	elif SaveSystem.night == 3:
		n = 3
	elif SaveSystem.night == 4:
		n = 4
	elif SaveSystem.night == 5:
		n = 5
	elif SaveSystem.night == 6:
		n = 6
	elif SaveSystem.night == 7:
		n = 7

	_timer_hour = Timer.new()
	add_child(_timer_hour)

	_timer_hour.connect("timeout", self, "_on_Timer_hour_timeout")
	_timer_hour.set_wait_time(85.1)
	_timer_hour.set_one_shot(false) # Make sure it loops
	_timer_hour.start()



func _process(delta):
	pass

func _on_Timer_hour_timeout():
	if n == 1:
		if get_parent().hour == 0:
			FuzowLevel = 0
			LichuLevel = 0
			TerpilLevel = 0
			WierLevel = 0
		if get_parent().hour == 1:
			FuzowLevel = 0
			LichuLevel = 0
			TerpilLevel = 0
			WierLevel = 0
		if get_parent().hour == 2:
			FuzowLevel = 1
			LichuLevel = 0
			TerpilLevel = 0
			WierLevel = 0
		if get_parent().hour == 3:
			FuzowLevel = 2
			LichuLevel = 0
			TerpilLevel = 1
			WierLevel = 1
		if get_parent().hour == 4:
			FuzowLevel = 3
			LichuLevel = 0
			TerpilLevel = 2
			WierLevel = 2
		if get_parent().hour == 5:
			FuzowLevel = 3
			LichuLevel = 0
			TerpilLevel = 2
			WierLevel = 2

	if n == 2:
		if get_parent().hour == 0:
			FuzowLevel = 3
			LichuLevel = 0
			TerpilLevel = 1
			WierLevel = 1
		if get_parent().hour == 1:
			FuzowLevel = 3
			LichuLevel = 0
			TerpilLevel = 1
			WierLevel = 1
		if get_parent().hour == 2:
			FuzowLevel = 4
			LichuLevel = 0
			TerpilLevel = 1
			WierLevel = 1
		if get_parent().hour == 3:
			FuzowLevel = 5
			LichuLevel = 0
			TerpilLevel = 2
			WierLevel = 2
		if get_parent().hour == 4:
			FuzowLevel = 6
			LichuLevel = 0
			TerpilLevel = 3
			WierLevel = 3
		if get_parent().hour == 5:
			FuzowLevel = 6
			LichuLevel = 0
			TerpilLevel = 3
			WierLevel = 3

	if n == 3:
		if get_parent().hour == 0:
			FuzowLevel = 0
			LichuLevel = 1
			TerpilLevel = 5
			WierLevel = 2
		if get_parent().hour == 1:
			FuzowLevel = 0
			LichuLevel = 1
			TerpilLevel = 5
			WierLevel = 2
		if get_parent().hour == 2:
			FuzowLevel = 1
			LichuLevel = 1
			TerpilLevel = 5
			WierLevel = 2
		if get_parent().hour == 3:
			FuzowLevel = 2
			LichuLevel = 1
			TerpilLevel = 6
			WierLevel = 3
		if get_parent().hour == 4:
			FuzowLevel = 3
			LichuLevel = 1
			TerpilLevel = 7
			WierLevel = 4
		if get_parent().hour == 5:
			FuzowLevel = 3
			LichuLevel = 1
			TerpilLevel = 7
			WierLevel = 4

	if n == 4:
		if get_parent().hour == 0:
			FuzowLevel = 2
			LichuLevel = 1
			TerpilLevel = 4
			WierLevel = 6
		if get_parent().hour == 1:
			FuzowLevel = 2
			LichuLevel = 2
			TerpilLevel = 4
			WierLevel = 6
		if get_parent().hour == 2:
			FuzowLevel = 3
			LichuLevel = 1
			TerpilLevel = 4
			WierLevel = 6
		if get_parent().hour == 3:
			FuzowLevel = 4
			LichuLevel = 2
			TerpilLevel = 5
			WierLevel = 7
		if get_parent().hour == 4:
			FuzowLevel = 5
			LichuLevel = 1
			TerpilLevel = 6
			WierLevel = 8
		if get_parent().hour == 5:
			FuzowLevel = 5
			LichuLevel = 2
			TerpilLevel = 6
			WierLevel = 8

	if n == 5:
		if get_parent().hour == 0:
			FuzowLevel = 5
			LichuLevel = 3
			TerpilLevel = 7
			WierLevel = 5
		if get_parent().hour == 1:
			FuzowLevel = 5
			LichuLevel = 3
			TerpilLevel = 7
			WierLevel = 5
		if get_parent().hour == 2:
			FuzowLevel = 6
			LichuLevel = 3
			TerpilLevel = 7
			WierLevel = 5
		if get_parent().hour == 3:
			FuzowLevel = 7
			LichuLevel = 3
			TerpilLevel = 8
			WierLevel = 6
		if get_parent().hour == 4:
			FuzowLevel = 8
			LichuLevel = 3
			TerpilLevel = 9
			WierLevel = 7
		if get_parent().hour == 5:
			FuzowLevel = 8
			LichuLevel = 3
			TerpilLevel = 9
			WierLevel = 7

	if n == 6:
		if get_parent().hour == 0:
			FuzowLevel = 10
			LichuLevel = 4
			TerpilLevel = 12
			WierLevel = 6
		if get_parent().hour == 1:
			FuzowLevel = 10
			LichuLevel = 4
			TerpilLevel = 12
			WierLevel = 6
		if get_parent().hour == 2:
			FuzowLevel = 11
			LichuLevel = 4
			TerpilLevel = 12
			WierLevel = 6
		if get_parent().hour == 3:
			FuzowLevel = 12
			LichuLevel = 4
			TerpilLevel = 13
			WierLevel = 7
		if get_parent().hour == 4:
			FuzowLevel = 13
			LichuLevel = 4
			TerpilLevel = 14
			WierLevel = 8
		if get_parent().hour == 5:
			FuzowLevel = 13
			LichuLevel = 4
			TerpilLevel = 14
			WierLevel = 8

	if n == 7:
		if get_parent().hour == 0:
			FuzowLevel = 20
			LichuLevel = 20
			TerpilLevel = 20
			WierLevel = 20
		if get_parent().hour == 1:
			FuzowLevel = 20
			LichuLevel = 20
			TerpilLevel = 20
			WierLevel = 20
		if get_parent().hour == 2:
			FuzowLevel = 20
			LichuLevel = 20
			TerpilLevel = 20
			WierLevel = 20
		if get_parent().hour == 3:
			FuzowLevel = 20
			LichuLevel = 20
			TerpilLevel = 20
			WierLevel = 20
		if get_parent().hour == 4:
			FuzowLevel = 20
			LichuLevel = 20
			TerpilLevel = 20
			WierLevel = 20
		if get_parent().hour == 5:
			FuzowLevel = 20
			LichuLevel = 20
			TerpilLevel = 20
			WierLevel = 20
