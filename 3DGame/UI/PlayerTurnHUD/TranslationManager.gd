extends Node

export(NodePath) var turn
export(NodePath) var objects



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
		
func translate_points(points):
	var language = SettingsManager.language
	var objectsText = get_node(objects)
	
	if language == "el":
		objectsText.text = points + "/8 ΑΝΤΙΚΕΙΜΕΝΑ"
	
	elif language == "es":
		objectsText.text = points + "/8 OBJETOS"
		
	elif language == "it":
		objectsText.text =  points + "/8 OGGETTI"
	
	elif language == "pt":
		objectsText.text =  points + "/8 OBJETOS "
		
			

