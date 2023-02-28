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


func _process(delta):
	pass
