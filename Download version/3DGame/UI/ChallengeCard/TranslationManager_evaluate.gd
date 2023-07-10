extends Node


export(NodePath) var reward
export(NodePath) var instructions


func _ready():
	translate(SettingsManager.language)
	
func translate(language):
	var instructionsText = get_node(instructions)
	var rewardText       = get_node(reward)


	if language == "el":
		rewardText.text       = "Μπορείς να κερδίσεις"
		instructionsText.text = "Ολοκλήρωσε ο παίκτης\nεπιτυχώς τη δοκιμασία;"
			
	elif language == "es":
		rewardText.text       = "Puedes ganar"
		instructionsText.text = "¿El jugador lo hizo bien?"
		
	elif language == "it":
		rewardText.text       = "Puoi vincere"
		instructionsText.text = "Ce l'ha fatta il giocatore?"
	
	elif language == "pt":
		rewardText.text           = "Podes ganhar"
		instructionsText.text = "O jogador acertou?"
