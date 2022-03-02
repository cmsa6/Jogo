extends TextureButton

export(String, FILE) var previousScene

func _input(event):
	#if Input.is_key_pressed(KEY_SPACE):
	if event.is_action_pressed("ui_accept"):
		_on_BackToSceneButton_pressed()
		

func _on_BackToSceneButton_pressed():
	print(previousScene)
	#get_node(previousScene).queue_free()
	
	get_tree().change_scene(previousScene)
