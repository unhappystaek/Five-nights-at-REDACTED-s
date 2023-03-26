extends Control

var FuzowLocation
var LichuLocation
var TerpilLocation
var WierStage: float = 0
var CurrentView
var CamCode: float = 7
var lastCam: String = "1a"

func _process(delta):
	
	TerpilLocation = get_parent().get_parent().get_parent().get_parent().get_child(1).get_child(0).TerpilLocation
	FuzowLocation = get_parent().get_parent().get_parent().get_parent().get_child(1).get_child(0).FuzowLocation
	LichuLocation = get_parent().get_parent().get_parent().get_parent().get_child(1).get_child(0).LichuLocation
	WierStage = get_parent().get_parent().get_parent().get_parent().get_child(1).get_child(0).WierStage
	
	
	# cams: 1a - stage, 1b - dining, 7 - wc, 6 - kitchen, 5 - backstage, 1c - cave,
	# 3 - closet, 2a - leftCorridor, 2b - leftDetector, 4a - rightCorridor, 4b - rightDetector
	
	#doorLeft, doorRight, ready (to jumpscare)
	
	# 1-lichu, 2-fuzow, 4-terpil, 8-wier

func _on_mapButton_1a_pressed():
	lastCam = "1a"
	CamCode = 0
	if TerpilLocation == "stage":
		CamCode += 4
	if FuzowLocation == "stage":
		CamCode += 2
	if LichuLocation == "stage":
		CamCode += 1

	if CamCode == 1:
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/scene/scene-l.jpg")
	elif CamCode == 2:
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/scene/scene-f.jpg")
	elif CamCode == 3:
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/scene/scene-fl.jpg")
	elif CamCode == 4:
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/scene/scene-t.jpg")
	elif CamCode == 5:
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/scene/scene-tl.jpg")
	elif CamCode == 6:
		$Cam_photo/camView.texture = ResourceLoader.load('res://textures_and_assets/camera_ui/scene/scene-tf.jpg')
	elif CamCode == 7:
		$Cam_photo/camView.texture = ResourceLoader.load('res://textures_and_assets/camera_ui/scene/scene-ftl.jpg')
	elif CamCode == 0:
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/scene/scene-empty.jpg")


func _on_mapButton_1b_pressed():
	lastCam = "1b"
	CamCode = 0
	if TerpilLocation == "dining":
		CamCode += 4
	if FuzowLocation == "dining":
		CamCode += 2
	if LichuLocation == "dining":
		CamCode += 1
		
	if CamCode == 1:
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/dining/dining-l.jpg")
	elif CamCode == 2:
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/dining/dining-f.jpg")
	elif CamCode == 3:
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/dining/dining-fl.jpg")
	elif CamCode == 4:
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/dining/dining-t.jpg")
	elif CamCode == 5:
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/dining/dining-tl.jpg")
	elif CamCode == 6:
		$Cam_photo/camView.texture = ResourceLoader.load('res://textures_and_assets/camera_ui/dining/dining-ft.jpg')
	elif CamCode == 7:
		$Cam_photo/camView.texture = ResourceLoader.load('res://textures_and_assets/camera_ui/dining/dining-ftl.jpg')
	elif CamCode == 0:
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/dining/dining-empty.jpg")


func _on_mapButton_2a_pressed():
	lastCam = "2a"
	if FuzowLocation == "leftCorridor":
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/left/leftCorridor-f.jpg")
	else:
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/left/leftCorridor-empty.jpg")


func _on_mapButton_2b_pressed():
	lastCam = "2b"
	if FuzowLocation == "leftDetector":
		pass


func _on_mapButton_4a_pressed():
	lastCam = "4a"
	CamCode = 0
	if TerpilLocation == "rightCorridor":
		CamCode += 4
	if LichuLocation == "rightCorridor":
		CamCode += 1


func _on_mapButton_4b_pressed():
	lastCam = "4b"
	CamCode = 0
	if TerpilLocation == "rightDetector":
		CamCode += 4
	if LichuLocation == "rightDetector":
		CamCode += 1


func _on_mapButton_1c_pressed():
	lastCam = "1c"
	pass # Replace with function body.


func _on_mapButton_5_pressed():
	lastCam = "5"
	if FuzowLocation == "backstage":
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/left/backstage-f.jpg")
	else:
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/left/backstage-empty.jpg")


func _on_mapButton_6_pressed():
	lastCam = "6"
	if TerpilLocation == "kitchen":
		pass



func _on_mapButton_7_pressed():
	lastCam = "7"
	CamCode = 0
	if TerpilLocation == "wc":
		CamCode += 4
	if LichuLocation == "wc":
		CamCode += 1


func _on_mapButton_3_pressed():
	lastCam = "3"
	if FuzowLocation == "closet":
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/left/closet-f.jpg")
	else:
		$Cam_photo/camView.texture = ResourceLoader.load("res://textures_and_assets/camera_ui/left/closet-empty.jpg")


func _on_CamArrows_pressed():
	if lastCam == "1a":
		_on_mapButton_1a_pressed()
	if lastCam == "1b":
		_on_mapButton_1b_pressed()
	if lastCam == "1c":
		_on_mapButton_1c_pressed()
	if lastCam == "2a":
		_on_mapButton_2a_pressed()
	if lastCam == "2b":
		_on_mapButton_2b_pressed()
	if lastCam == "4a":
		_on_mapButton_4a_pressed()
	if lastCam == "4b":
		_on_mapButton_4b_pressed()
	if lastCam == "3":
		_on_mapButton_3_pressed()
	if lastCam == "5":
		_on_mapButton_5_pressed()
	if lastCam == "6":
		_on_mapButton_6_pressed()
	if lastCam == "7":
		_on_mapButton_7_pressed()
