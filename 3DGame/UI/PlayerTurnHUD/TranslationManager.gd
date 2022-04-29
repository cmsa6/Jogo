extends Node

export(NodePath) var turn



func _ready():
	translate(SettingsManager.language)
	
func translate(language):
	var turnText = get_node(turn)

	if language == "el":
		turnText.text = "ΕΙΝΑΙ Η ΣΕΙΡΑ ΣΟΥ"
	
	elif language == "es":
		turnText.text = "ES TU TURNO"
		
	elif language == "it":
		turnText.text = "È IL TUO TURNO"
	
	elif language == "pt":
		turnText.text = "É A TUA VEZ "
		
			

