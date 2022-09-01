extends TextureButton

export(String, FILE) var previousScene


func create_card():
	get_tree().change_scene(previousScene)
