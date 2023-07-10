extends Node


export(NodePath) var reward


func _ready():
	translate(SettingsManager.language)
	
func translate(language):
	var rewardText = get_node(reward)


	if language == "el":
		rewardText.text = "Μπορείς να κερδίσεις"
			
	elif language == "es":
		rewardText.text = "Puedes ganar"
		
	elif language == "it":
		rewardText.text = "Puoi vincere"
	
	elif language == "pt":
		rewardText.text = "Podes ganhar"
