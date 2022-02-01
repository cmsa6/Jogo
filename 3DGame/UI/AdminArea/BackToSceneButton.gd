extends TextureButton

export(String, FILE) var previousScene



func _on_BackToSceneButton_pressed():
	print(previousScene)
	#get_node(previousScene).queue_free()
	
	get_tree().change_scene(previousScene)
