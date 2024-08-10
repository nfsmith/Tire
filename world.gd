extends Node3D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#get speed from tire linear velocity and convert to freedom units
	$UI/Speedometer.text = str(int($Tire/TireOrb.get_linear_velocity().length() * 2.23694)) + " MPH"

func StartGame():
	$UI/StartMenu.hide()
	$Tire.StartGame()

func ShowDialogue(_text):
	$UI/Dialogue/ColorRect/Label.text = _text	
	$UI/Dialogue.show()

func HideDialogue():
	$UI/Dialogue.hide()
