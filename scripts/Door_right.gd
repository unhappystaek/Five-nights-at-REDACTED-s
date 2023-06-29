extends Spatial


var doorOpen: bool = true
var ready: bool = true
var isEnergy: bool = true
var lightOn: bool = false
var lightAnimReady: bool = false

func _ready():
	$Buttons/button_light/Light_on_right.play("RESET")


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
	
func _process(delta):
	if get_parent().get_parent().get_child(1).get_child(0).TerpilLocation == "doorRight" and lightOn == true:
		$light_right/Door_texture_right_dark.visible = false
		$light_right/Door_texture_right_empty.visible = false
		$light_right/Door_texture_right_terpil.visible = true
	elif get_parent().get_parent().get_child(1).get_child(0).TerpilLocation != "doorRight" and lightOn == true:
		$light_right/Door_texture_right_dark.visible = false
		$light_right/Door_texture_right_empty.visible = true
		$light_right/Door_texture_right_terpil.visible = false
	elif lightOn == false:
		$light_right/Door_texture_right_dark.visible = true
		$light_right/Door_texture_right_empty.visible = false
		$light_right/Door_texture_right_terpil.visible = false
		
	if Input.is_mouse_button_pressed( 1 ) == false:
		lightOn = false
		if lightAnimReady == true:
			lightAnimReady = false
			$Buttons/button_light/Light_on_right.play_backwards("Light_on_right")


func _on_button_light_input_event(camera, event, position, normal, shape_idx):
	var mouse_click = event as InputEventMouseButton
	if mouse_click and mouse_click.button_index == 1 and mouse_click.pressed and isEnergy == true:
		lightOn = true
		$Buttons/button_light/Light_on_right.play("Light_on_right")
		lightAnimReady = true
