extends TextureButton

export(String, FILE) var previousScene


func create_card():
	print("selected")
	get_tree().change_scene(previousScene)
