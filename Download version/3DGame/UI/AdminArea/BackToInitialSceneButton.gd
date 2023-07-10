extends TextureButton

export(String, FILE) var previousScene


		
		

func _on_BackToSceneButton_pressed():
	get_tree().change_scene(previousScene)


