extends TextureButton

export(String, FILE) var previousScene
signal save_language()

func _input(event):
	#if Input.is_key_pressed(KEY_SPACE):
	if event.is_action_pressed("Enter"):
		emit_signal("button_down")
		initiate_game()
		

func _on_BackToSceneButton_pressed():
	#AudioManager.stream_paused = true
	
	#get_node(previousScene).queue_free()
	print(SettingsManager.language)
	
	ChallengesManager.register_cards("SERVICES")
	ChallengesManager.register_cards("HELP")
	ChallengesManager.register_cards("COMMERCIAL")
	ChallengesManager.register_cards("LEISURE")	
	
	get_tree().change_scene(previousScene)


func initiate_game():
	emit_signal("save_language")
	_on_BackToSceneButton_pressed()

	




