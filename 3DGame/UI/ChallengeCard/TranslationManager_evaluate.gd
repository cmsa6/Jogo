extends Node


#export(NodePath) var challengeName
#export(NodePath) var reward
export(NodePath) var instructions


func _ready():
	translate(SettingsManager.language)
	
func translate(language):
	#var challengeNameText = get_node(challengeName)
	var instructionsText = get_node(instructions)


	if language == "el":
		#challengeNameText.text = "Όνομα πρόκλησης"
		instructionsText.text = "Το κατάλαβε σωστά ο παίκτης;"
			
	elif language == "es":
		#challengeNameText.text = "Nombre del Desafío"
		instructionsText.text = "¿El jugador lo hizo bien?"
		
	elif language == "it":
		#challengeNameText.text = "Nome della Sfida"
		instructionsText.text = "Il giocatore ha capito bene?"
	
	elif language == "pt":
		#challengeNameText.text = "Nome do Desafio"
		instructionsText.text = "O jogador acertou?"
