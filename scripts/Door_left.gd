extends Spatial


var doorOpen: bool = true
var ready: bool = true
var isEnergy: bool = true
var lightOn: bool = false
var lightAnimReady: bool = false

func _ready():
	$Buttons/button_light/Light_on_left.play("RESET")

func _on_button_door_left_input_event(camera, event, click_position, click_normal, shape_idx):
	var mouse_click = event as InputEventMouseButton
	if mouse_click and mouse_click.button_index == 1 and mouse_click.pressed and ready == true and isEnergy == true:
		if doorOpen == true :
			ready = false
			doorOpen = false
			$Door_close_left.play("Door_close_left")
		else:
			ready = false
			doorOpen = true
			$Door_open_left.play("Door_open_left")


func _on_Door_close_left_animation_finished(Door_close_left):
	ready = true


func _on_Door_open_left_animation_finished(Door_open_left):
	ready = true


func _process(delta):
	if get_parent().get_parent().get_child(1).get_child(0).FuzowLocation == "doorLeft" and lightOn == true:
		$light_left/Door_texture_left_dark.visible = false
		$light_left/Door_texture_left_empty.visible = false
		$light_left/Door_texture_left_fuzow.visible = true
	elif get_parent().get_parent().get_child(1).get_child(0).FuzowLocation != "doorLeft" and lightOn == true:
		$light_left/Door_texture_left_dark.visible = false
		$light_left/Door_texture_left_empty.visible = true
		$light_left/Door_texture_left_fuzow.visible = false
	elif lightOn == false:
		$light_left/Door_texture_left_dark.visible = true
		$light_left/Door_texture_left_empty.visible = false
		$light_left/Door_texture_left_fuzow.visible = false
		
	if Input.is_mouse_button_pressed( 1 ) == false:
		lightOn = false
		if lightAnimReady == true:
			lightAnimReady = false
			$Buttons/button_light/Light_on_left.play_backwards("Light_on_left")


func _on_button_light_input_event(camera, event, position, normal, shape_idx):
	var mouse_click = event as InputEventMouseButton
	if mouse_click and mouse_click.button_index == 1 and mouse_click.pressed and isEnergy == true:
		lightOn = true
		$Buttons/button_light/Light_on_left.play("Light_on_left")
		lightAnimReady = true
