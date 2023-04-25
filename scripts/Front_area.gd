extends Spatial


var is_energy: bool = true


# Called when the node enters the scene tree for the first time.
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
