extends Node

var _timer = null
var _timer_gold = null
var num: int
var num2: int
var golden_working: bool = false
var ct6: int = 0

func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(2.0)
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
			
	num2 = randi()%100000+1
	if get_parent().phoneTalking == false and num2 == 43269 and get_parent().phone_waiting == false:
		Gold()


func Gold():
	$random.play("golden")
	golden_working = true
	_timer_gold = Timer.new()
	add_child(_timer_gold)

	_timer_gold.connect("timeout", self, "_on_Timer_gold_timeout")
	_timer_gold.set_wait_time(30.0)
	_timer_gold.set_one_shot(true) # Make sure it loops
	_timer_gold.start()
	
func _on_Timer_gold_timeout():
	get_tree().change_scene("res://scenes/actual_scenes/Night_endings/goldenLichuJumpscare.tscn")


func _on_CamArrows_pressed():
	if golden_working == true:
		ct6 += 1
		
func _process(delta):
	if ct6 >= 6:
		ct6 = 0
		golden_working = false
		$random.stop()
		$random.play("RESET")
		_timer_gold.stop()

