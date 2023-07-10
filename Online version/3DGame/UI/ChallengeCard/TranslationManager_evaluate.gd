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
		rewardText.text       = "Puedes ganar"
		instructionsText.text = "¿El jugador lo hizo bien?"
		
	elif language == "it":
		#challengeNameText.text = "Nome della Sfida"
		rewardText.text       = "Puoi vincere"
		instructionsText.text = "Ce l'ha fatta il giocatore?"
	
	elif language == "pt":
		#challengeNameText.text = "Nome do Desafio"
		rewardText.text           = "Podes ganhar"
		instructionsText.text = "O jogador acertou?"
