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
	print("talking")
	emit_signal("stop_talking")
	print(get_node(textToSpeak).text)
	var text = get_node(textToSpeak).text
	if "\"" in text:
		text = text.replace("\"","")
	emit_signal("talk", text)


func teste():
	self.pressed = false
	emit_signal("stop_talking")
	print("doing stuff")
	emit_signal("talk", "hello")
