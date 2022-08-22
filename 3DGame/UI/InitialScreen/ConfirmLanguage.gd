extends TextureButton

export(String, FILE) var initialScene


var languageSelected = "en" setget set_languageSelected, get_languageSelected



func _input(event):
	if event.is_action_pressed("RightArrow") and self.visible:
		emit_signal("button_down")
		emit_signal("pressed")



func set_languageSelected(lang):
	languageSelected = lang
	print(languageSelected)
	
func get_languageSelected():
	return languageSelected
	
func save_languageSelected():
	SettingsManager.language = get_languageSelected()
	start_game()
	
func start_game():
	get_tree().change_scene(initialScene)
	



