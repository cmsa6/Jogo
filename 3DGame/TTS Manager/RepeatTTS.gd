extends TextureButton

export (NodePath) var textToSpeak

signal talk(text)
signal stop_talking()


func repeat():
	self.pressed = false
	emit_signal("stop_talking")
	emit_signal("talk", get_node(textToSpeak).text)

