extends Node


export(NodePath) var instructionsNode






	
func translate(language):
	var instructions = get_node(instructionsNode)

	if language == "el":
		instructions.text = "επιλέξτε μια γλώσσα"
		
		
	elif language == "es":
		instructions.text = "Por favor, seleccione un idioma"
		
	
	elif language == "it":
		instructions.text = "Si prega di selezionare una lingua"
		
	
	elif language == "pt":
		instructions.text = "Por favor selecione um idioma"
		
		
		
