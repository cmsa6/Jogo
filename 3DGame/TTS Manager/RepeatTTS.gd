extends TextureButton

export (NodePath) var textToSpeak

signal talk(text)
signal stop_talking()

func _input(event):
	if event.is_action_pressed("Space"):
		emit_signal("button_down")
		emit_signal("pressed")


func repeat():
	self.pressed = false
	emit_signal("stop_talking")
	emit_signal("talk", get_node(textToSpeak).text)

