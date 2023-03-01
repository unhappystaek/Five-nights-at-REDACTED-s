extends Spatial


var doorOpen: bool = true
var ready: bool = true
var isEnergy: bool = true

func _ready():
	pass 


func _on_button_door_right_input_event(camera, event, click_position, click_normal, shape_idx):
	var mouse_click = event as InputEventMouseButton
	if mouse_click and mouse_click.button_index == 1 and mouse_click.pressed and ready == true and isEnergy == true:
		if doorOpen == true :
			ready = false
			doorOpen = false
			$Door_close_right.play("Door_close_right")
		else:
			ready = false
			doorOpen = true
			$Door_open_right.play("Door_open_right")




func _on_Door_open_right_animation_finished(anim_name):
	ready = true


func _on_Door_close_right_animation_finished(anim_name):
	ready = true
