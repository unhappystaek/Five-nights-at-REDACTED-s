extends Control

var FuzowLocation: String = "stage"
var LichuLocation: String = "stage"
var TerpilLocation: String = "stage"
var WierStage: float = 0
var CurrentView: String = "stage"
var CamCode: float = 7

func _ready():
	pass # Replace with function body.

func _process(delta):
	if SaveSystem.night == 1:
		$Night_label.text = "Night 1";
	elif SaveSystem.night == 2:
		$Night_label.text = "Night 2";
	elif SaveSystem.night == 3:
		$Night_label.text = "Night 3";
	elif SaveSystem.night == 4:
		$Night_label.text = "Night 4";
	elif SaveSystem.night == 5:
		$Night_label.text = "Night 5";
	elif SaveSystem.night == 6:
		$Night_label.text = "Night 6";
	elif SaveSystem.night == 7:
		$Night_label.text = "Night 7";
		
	TerpilLocation = get_parent().get_parent().get_parent().get_child(1).get_child(0).TerpilLocation
	FuzowLocation = get_parent().get_parent().get_parent().get_child(1).get_child(0).FuzowLocation
	LichuLocation = get_parent().get_parent().get_parent().get_child(1).get_child(0).LichuLocation
	WierStage = get_parent().get_parent().get_parent().get_child(1).get_child(0).WierStage
	
	# cams: 1a - stage, 1b - dining, 7 - wc, 6 - kitchen, 5 - backstage, 1c - cave,
	# 3 - closet, 2a - leftCorridor, 2b - leftDetector, 4a - rightCorridor, 4b - rightDetector
	
	#doorLeft, doorRight, ready (to jumpscare)
	
	if CurrentView == "stage":
		CamCode = 0
		if TerpilLocation == "stage":
			CamCode += 4
		if FuzowLocation == "stage":
			CamCode += 2
		if LichuLocation == "stage":
			CamCode += 1
	elif CurrentView == "dining":
		CamCode = 0
		if TerpilLocation == "dining":
			CamCode += 4
		if FuzowLocation == "dining":
			CamCode += 2
		if LichuLocation == "dining":
			CamCode += 1
	elif CurrentView == "wc":
		CamCode = 0
		if TerpilLocation == "wc":
			CamCode += 4
		if LichuLocation == "wc":
			CamCode += 1
	elif CurrentView == "kitchen":
		CamCode = 0
		if TerpilLocation == "kitchen":
			CamCode += 4
	elif CurrentView == "backstage":
		CamCode = 0
		if FuzowLocation == "backstage":
			CamCode += 2
	elif CurrentView == "cave":
		pass
	elif CurrentView == "closet":
		CamCode = 0
		if FuzowLocation == "closet":
			CamCode += 2
	elif CurrentView == "leftCorridor":
		CamCode = 0
		if FuzowLocation == "leftCorridor":
			CamCode += 2
	elif CurrentView == "leftDetector":
		CamCode = 0
		if FuzowLocation == "leftDetector":
			CamCode += 2
	elif CurrentView == "rightCorridor":
		CamCode = 0
		if TerpilLocation == "rightCorridor":
			CamCode += 4
		if LichuLocation == "rightCorridor":
			CamCode += 1
	elif CurrentView == "rightDetector":
		CamCode = 0
		if TerpilLocation == "rightDetector":
			CamCode += 4
		if LichuLocation == "rightDetector":
			CamCode += 1
		
	# 1-lichu, 2-fuzow, 4-terpil, 8-wier

