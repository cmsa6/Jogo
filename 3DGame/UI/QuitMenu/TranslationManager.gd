extends Node


export(NodePath) var instructions


func _ready():
	translate(SettingsManager.language)
	
func translate(language):
	var instructionsText = get_node(instructions)


	if language == "el":
		instructionsText.text = "Θέλουμε να τελειώσουμε το παιχνίδι;"
			
	elif language == "es":
		instructionsText.text = "¿Queremos terminar el juego?"

		
	elif language == "it":
		instructionsText.text = "Vogliamo finire il gioco?"

	
	elif language == "pt":
		instructionsText.text = "Queremos terminar o jogo?"
		
func translate_win(name):
	var language = SettingsManager.language
	var instructionsText = get_node(instructions)

	if language == "el":
		instructionsText.text = "Συγχαρητήρια " + name + "! Μόλις ολοκλήρωσες το σπίτι σου!! Θέλουμε να τελειώσει το παιχνίδι τώρα;"
			
	elif language == "es":
		instructionsText.text = "¡Felicidades " + name + "! Acabas de terminar tu casa!! ¿Queremos terminar el juego ahora?"

		
	elif language == "it":
		instructionsText.text = "Congratulazioni " + name + "! Hai appena completato la tua casa!! Vogliamo chiudere il gioco adesso?"

	
	elif language == "pt":
		instructionsText.text = "Parabéns " + name + "! Acabaste de completar tua casa!! Queremos terminar o jogo agora?"

	elif language == "en":
		instructionsText.text = "Congratulations "+ name + "! You just completed your house!! Do we want to end the game now?"
