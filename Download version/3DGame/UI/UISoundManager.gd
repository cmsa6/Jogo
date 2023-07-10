extends Node

onready var confirmButton = $ConfirmButtonSound
onready var playButton = $PlayButtonSound
onready var selectButton = $SelectButtonSound

func confirm():
	confirmButton.play(0)
	
func play():
	playButton.play(0)
	
func select():
	selectButton.play(0)
