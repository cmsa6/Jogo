extends TextureButton

export(String, FILE) var previousScene

func _input(event):
	#if event.is_action_pressed("RightArrow"):
		#emit_signal("button_down")
		#initiate_game()
	pass		
		

func _on_BackToSceneButton_pressed():
	#AudioManager.stream_paused = true
	
	#get_node(previousScene).queue_free()
	
	ChallengesManager.register_cards("SERVICES")
	ChallengesManager.register_cards("HELP")
	ChallengesManager.register_cards("COMMERCIAL")
	ChallengesManager.register_cards("LEISURE")	
	
	get_tree().change_scene(previousScene)


func initiate_game():
	_on_BackToSceneButton_pressed()

	




