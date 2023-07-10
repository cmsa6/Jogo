extends Node


export(NodePath) var instructionsQuitNode
export(NodePath) var instructionsCongratsNode


func _ready():
	translate(SettingsManager.language)
	
func translate(language):
	var instructionsQuit = get_node(instructionsQuitNode)


	if language == "el":
		instructionsQuit.text = "Θέλεις να σταματήσεις να παίζεις;"
			
	elif language == "es":
		instructionsQuit.text = "¿Quieres terminar el juego?"

		
	elif language == "it":
		instructionsQuit.text = "Vogliamo finire il gioco?"

	
	elif language == "pt":
		instructionsQuit.text = "Queremos terminar o jogo?"
		
	elif language == "en":
		instructionsQuit.text = "Do we want to finish the game?"
		
func translate_win(name):
	var language = SettingsManager.language
	var instructionsQuit     = get_node(instructionsQuitNode)
	var instructionsCongrats = get_node(instructionsCongratsNode)

	if language == "el": 
		instructionsCongrats.text = "Συγχαρητήρια " + name + "!\nΜόλις συμπλήρωσες όλα τα αντικειμενα στο σπίτι σου!"
		instructionsQuit.text     =  "Θέλεις να σταματήσεις να παίζεις;"
			
	elif language == "es":
		instructionsCongrats.text = "Enhorabuena " + name + "!\nAcabas de completar la casa!"
		instructionsQuit.text     = "¿Quieres terminar el juego?"

		
	elif language == "it":  
		instructionsCongrats.text = "Congratulazioni " + name + "!\nHai appena completato tua casa!"
		instructionsQuit.text     = "Vogliamo finire il gioco?"

	
	elif language == "pt":
		instructionsCongrats.text = "Parabéns " + name + "!\nAcabaste de completar tua casa!"
		instructionsQuit.text     = "Queremos terminar o jogo agora?"
		
	elif language == "en":
		instructionsCongrats.text = "Congratulations "+ name + "!\nYou just completed your house!"
		instructionsQuit.text     = "Do we want to end the game now?"
