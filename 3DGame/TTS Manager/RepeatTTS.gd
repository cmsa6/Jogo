extends TextureButton

export (NodePath) var textToSpeak

signal talk(text)
signal stop_talking()

func _input(event):
	if event.is_action_pressed("select_avatars") and self.get_parent().get_parent().visible:
		var numberTTS = self.name[-1]
		var shortcutNumber = event.as_text()[-1]
		if numberTTS == shortcutNumber:
			emit_signal("button_down")
			emit_signal("pressed")


func repeat():
	self.pressed = false
	emit_signal("stop_talking")
	emit_signal("talk", get_node(textToSpeak).text)

