extends Node


export(NodePath) var skipNode


func _ready():
	translate(SettingsManager.language)



	
func translate(language):
	var skip = get_node(skipNode)

	if language == "en":
		skip.text = "Skip this challenge"
		
		
	elif language == "es":
		skip.text = "Saltar este reto"
		
	
	elif language == "it":
		skip.text = "Salta questa sfida"
		
	
	elif language == "pt":
		skip.text = "Saltar este desafio"
		
	elif language == "el":
		skip.text = "Παραλείψτε αυτή τη δοκιμασία"
		
		
		
