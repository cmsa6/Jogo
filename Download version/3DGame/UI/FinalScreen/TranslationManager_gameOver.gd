extends Node


export(NodePath) var gameover


func _ready():
	translate(SettingsManager.language)
	
func translate(language):
	var gameoverText    = get_node(gameover)
	
			
	if language == "el":
		gameoverText.text = "Τέλος παιχνιδιού"

		
	elif language == "es":
		gameoverText.text = "El juego ha terminado"
		
	elif language == "it":
		gameoverText.text = "Hai perso"

	
	elif language == "pt":
		gameoverText.text = "O jogo acabou"

	
