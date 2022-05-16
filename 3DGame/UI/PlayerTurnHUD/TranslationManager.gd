extends Node

export(NodePath) var turn
export(NodePath) var objects



func _ready():
	translate(SettingsManager.language)
	translate_points('0')
	
func translate(language):
	var turnText = get_node(turn)

	if language == "el":
		turnText.text = "ΕΙΝΑΙ Η ΣΕΙΡΑ ΣΟΥ"
	
	elif language == "es":
		turnText.text = "Es tu turno"
		
	elif language == "it":
		turnText.text = "È IL TUO TURNO"
	
	elif language == "pt":
		turnText.text = "É a tua vez"
		
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
		
	elif language == "en":
		objectsText.text =  points + "/8 OBJECTS "

