extends Spatial

var screensize
var pos
var minLeft
var minRight
var angle: float = 0

func _ready():
	screensize = get_viewport().size
	minLeft = 10 * screensize / 100
	minRight = 45 * screensize / 100
	
func _process(delta):
	pos = get_viewport().get_mouse_position()
	angle = $main_camera.rotation.y
	if pos.x < minLeft.x and angle < 0.6 :
		$main_camera.rotation.y += 0.03
	if pos.x > minRight.x and angle > -0.6:
		$main_camera.rotation.y -= 0.03

func _on_Door_close_right_animation_finished(anim_name):
	pass # Replace with function body.


func _on_Door_open_right_animation_finished(anim_name):
	pass # Replace with function body.
