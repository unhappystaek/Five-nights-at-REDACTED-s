extends Camera

var cam_up: bool = false
var cam_on: bool = false

func _ready():
	pass # Replace with function body.


func _process(delta):
	if cam_up == true and $Cambook/rotation_axis.rotation_degrees.x < 0 :
		$Cambook/rotation_axis.rotation_degrees.x += 6
	elif cam_up == false and $Cambook/rotation_axis.rotation_degrees.x > -200:
		$Cambook/rotation_axis.rotation_degrees.x -= 6
		
	if $Cambook/rotation_axis.rotation_degrees.x == 2:
		$UI/Cams/Cam_view.visible = true
		cam_on = true
		$UI/Cams/Cam_photo.visible = true
		
		
	elif $Cambook/rotation_axis.rotation_degrees.x != 2:
		$UI/Cams/Cam_view.visible = false
		cam_on = false
		$UI/Cams/Cam_photo.visible = false
		
	
	if $Cambook/rotation_axis.rotation_degrees.x > 2:
		$Cambook/rotation_axis.rotation_degrees.x = 2
		
	if get_parent().get_parent().isBlackout == true:
		$Cambook/rotation_axis.rotation_degrees.x = -200
		
	if cam_up == false and get_parent().get_parent().get_child(1).get_child(0).FuzowLocation == "ready":
		get_tree().change_scene("res://scenes/actual_scenes/Night_endings/fuzowJumpscare.tscn")
		
	if cam_up == false and get_parent().get_parent().get_child(1).get_child(0).TerpilLocation == "ready":
		get_tree().change_scene("res://scenes/actual_scenes/Night_endings/terpilJumpscare.tscn")
	
	
func _on_CamArrows_pressed():
	if cam_up == true:
		cam_up =false
		get_parent().get_parent().get_child(1).get_child(0).cam_up = cam_up
	elif cam_up == false and get_parent().get_parent().isBlackout == false:
		cam_up = true
		get_parent().get_parent().get_child(1).get_child(0).cam_up = cam_up
	
