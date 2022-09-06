extends Node


export(NodePath) var instructionsNode






	
func translate(language):
	var instructions = get_node(instructionsNode)

	if language == "el":
		instructions.text = "Παρακαλώ επιλέξτε μια γλώσσα"
		
		
	elif language == "es":
		instructions.text = "Por favor, selecciona un idioma"
		
	
	elif language == "it":
		instructions.text = "Si prega di selezionare una lingua"
		
	
	elif language == "pt":
		instructions.text = "Por favor selecione um idioma"
		
		
		
