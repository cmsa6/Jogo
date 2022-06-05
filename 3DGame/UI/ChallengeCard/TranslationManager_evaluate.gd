extends Node


#export(NodePath) var challengeName
export(NodePath) var reward
export(NodePath) var instructions


func _ready():
	translate(SettingsManager.language)
	
func translate(language):
	#var challengeNameText = get_node(challengeName)
	var instructionsText = get_node(instructions)
	var rewardText       = get_node(reward)


	if language == "el":
		#challengeNameText.text = "Όνομα πρόκλησης"
		rewardText.text       = "Μπορείς να κερδίσεις"
		instructionsText.text = "Ολοκλήρωσε ο παίκτης\nεπιτυχώς τη δοκιμασία;"
			
	elif language == "es":
		#challengeNameText.text = "Nombre del Desafío"
		instructionsText.text = "¿El jugador lo hizo bien?"
		
	elif language == "it":
		#challengeNameText.text = "Nome della Sfida"
		instructionsText.text = "Il giocatore ha capito bene?"
	
	elif language == "pt":
		#challengeNameText.text = "Nome do Desafio"
		rewardText.text           = "Podes ganhar"
		instructionsText.text = "O jogador acertou?"