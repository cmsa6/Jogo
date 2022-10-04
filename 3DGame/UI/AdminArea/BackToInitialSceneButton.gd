extends TextureButton

export(String, FILE) var previousScene


		
		

func _on_BackToSceneButton_pressed():
	#AudioManager.stream_paused = true
	
	#get_node(previousScene).queue_free()
	
#	ChallengesManager.register_cards("SERVICES")
#	ChallengesManager.register_cards("HELP")
#	ChallengesManager.register_cards("COMMERCIAL")
#	ChallengesManager.register_cards("LEISURE")	
	
	get_tree().change_scene(previousScene)
	print("changing")

