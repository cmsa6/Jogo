extends TextureButton

export(String, FILE) var previousScene

func _input(event):
	#if Input.is_key_pressed(KEY_SPACE):
	if event.is_action_pressed("ui_accept"):
		print("foi aqui que entrei ne 2")
		_on_BackToSceneButton_pressed()
		

func _on_BackToSceneButton_pressed():
	print(previousScene)
	#get_node(previousScene).queue_free()
	
	ChallengesManager.register_cards("SERVICES")
	ChallengesManager.register_cards("HELP")
	ChallengesManager.register_cards("COMMERCIAL")
	ChallengesManager.register_cards("LEISURE")	
	
	get_tree().change_scene(previousScene)


	




