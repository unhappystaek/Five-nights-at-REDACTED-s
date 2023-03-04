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
		
		
		$UI/Cams/Cam_photo.visible = true
		
		
	elif $Cambook/rotation_axis.rotation_degrees.x != 2:
		$UI/Cams/Cam_view.visible = false
		
		
		$UI/Cams/Cam_photo.visible = false
		
	
	if $Cambook/rotation_axis.rotation_degrees.x > 2:
		$Cambook/rotation_axis.rotation_degrees.x = 2
		
	if get_parent().get_parent().isBlackout == true:
		$Cambook/rotation_axis.rotation_degrees.x = -200
	
		
func _on_CamArrows_pressed():
	if cam_up == true:
		cam_up =false
	elif cam_up == false and get_parent().get_parent().isBlackout == false:
		cam_up = true
	
