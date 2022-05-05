extends Node


#export(NodePath) var challengeName
export(NodePath) var reward


func _ready():
	translate(SettingsManager.language)
	
func translate(language):
#	var challengeNameText = get_node(challengeName)
	var rewardText = get_node(reward)


	if language == "el":
		#challengeNameText.text = "Όνομα πρόκλησης"
		rewardText.text = "ανταμοιβή πρόκλησης"
			
	elif language == "es":
		#challengeNameText.text = "Nombre del Desafío"
		rewardText.text = "Recompensa"
		
	elif language == "it":
		#challengeNameText.text = "Nome della Sfida"
		rewardText.text = "Ricompensa"
	
	elif language == "pt":
		#challengeNameText.text = "Nome do Desafio"
		rewardText.text = "Recompensa"
