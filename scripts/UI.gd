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
		




