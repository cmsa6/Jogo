extends Node

export(NodePath) var qolPointsNode
export(NodePath) var cfPointsNode


func translate(qolPoints, cfPoints):
	var qolPointsText  = get_node(qolPointsNode)
	var cfPointsText   = get_node(cfPointsNode)
	
	var language = SettingsManager.language
	
	if language == "el":
		qolPointsText.text = str(qolPoints) + " Πόντοι"
		cfPointsText.text  = str(cfPoints) + " Πόντοι"
		

		
	elif language == "es":
		qolPointsText.text = str(qolPoints) + " PUNTOS"
		cfPointsText.text  = str(cfPoints) + " PUNTOS"
		

	elif language == "it":
		qolPointsText.text = str(qolPoints) + " PUNTI"
		cfPointsText.text  = str(cfPoints) + " PUNTI"
		
	
	elif language == "pt":
		qolPointsText.text  = str(qolPoints) + " PONTOS"
		cfPointsText.text  = str(cfPoints) + " PONTOS"
		
	elif language == "en":
		qolPointsText.text  = str(qolPoints) + " POINTS"
		cfPointsText.text  = str(cfPoints) + " POINTS"
		
