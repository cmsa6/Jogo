extends Node

export(NodePath) var instructions

	
func translate(value):
	var language = SettingsManager.language
	var instructionsText = get_node(instructions)
	
	if language == "el":
		instructionsText.text = "Προχώρησε " + value + " βήματα"
	
	elif language == "es":
		instructionsText.text = "Va a caminar " +  value +  " pasos"
		
	elif language == "it":
		instructionsText.text = "Sta per fare " + value + " passi"
	
	elif language == "pt":
		instructionsText.text = "Vai andar " + value + " passos"
		
	elif language == "en":
		instructionsText.text = "Is gonna walk " + value + " steps"
