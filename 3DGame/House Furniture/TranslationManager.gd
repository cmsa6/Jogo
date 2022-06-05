extends Node

export(NodePath) var objects


func _ready():
	translate(SettingsManager.language)
	
func translate(language):
	var objectsText = get_node(objects)

	if language == "el":
		objectsText.text = " Αντικείμενα"
	
	elif language == "es":
		objectsText.text = " OBJETOS"
		
	elif language == "it":
		objectsText.text = " OGGETTI"	
	
	elif language == "pt":
		objectsText.text = " OBJETOS"
		
	elif language == "en":
		objectsText.text = " OBJECTS"
			
