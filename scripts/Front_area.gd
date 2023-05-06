extends Spatial

var _timer = null
var is_energy: bool = true
var phone_waiting: bool = false

func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(3.0)
	_timer.set_one_shot(true) # Make sure it loops
	_timer.start()

func _process(delta):
	if is_energy == true:
		if SaveSystem.night == 1:
			$Fan.rotation.z += 1
		elif SaveSystem.night == 2:
			$Fan.rotation.x += 1
		elif SaveSystem.night == 3:
			$Fan.rotation.y += 1
		elif SaveSystem.night == 4:
			$Fan.rotation.x += 1
			$Fan.rotation.z += 1
		elif SaveSystem.night == 5:
			$Fan.rotation.y += 1
			$Fan.rotation.x += 1
		elif SaveSystem.night == 6:
			$Fan.rotation.y += 1
			$Fan.rotation.z += 1
		elif SaveSystem.night == 7:
			$Fan.rotation.y += 1
			$Fan.rotation.z += 1
			$Fan.rotation.x += 1
	


func _on_Area_input_event(camera, event, click_position, click_normal, shape_idx):
	var mouse_click = event as InputEventMouseButton
	if mouse_click and mouse_click.button_index == 1 and mouse_click.pressed:
		$posters/lee/AnimationPlayer.play("posterFunny")


func _on_phoneArea_input_event(camera, event, position, normal, shape_idx):
	var mouse_click = event as InputEventMouseButton
	if mouse_click and mouse_click.button_index == 1 and mouse_click.pressed and phone_waiting == true:
		phone_waiting = false
		$phone/phoneAudio.stop()
		if SaveSystem.night == 1:
			$phone/AnimationPlayer.play("p1")
		elif SaveSystem.night == 2:
			$phone/AnimationPlayer.play("p2")
		elif SaveSystem.night == 3:
			$phone/AnimationPlayer.play("p3")
		elif SaveSystem.night == 4:
			$phone/AnimationPlayer.play("p4")
			
func _on_Timer_timeout():
	if SaveSystem.night == 1 or SaveSystem.night == 2 or SaveSystem.night == 3 or SaveSystem.night == 4:
		get_parent().get_parent().phoneTalking = true
		$phone/AnimationPlayer.play("ringing")
		phone_waiting = true


func _on_AnimationPlayer_animation_finished(anim_name):
	get_parent().get_parent().phoneTalking = false
