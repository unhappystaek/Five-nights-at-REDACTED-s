extends Spatial


var doorOpen: bool = true

func _ready():
	pass 


func _on_button_door_input_event(camera, event, click_position, click_normal, shape_idx):
	var mouse_click = event as InputEventMouseButton
	if mouse_click and mouse_click.button_index == 1 and mouse_click.pressed:
		if doorOpen == true :
			doorOpen = false
			$Door_close.play("Door_close")
		else:
			doorOpen = true
			$Door_open.play("Door_open")


