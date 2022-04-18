extends TextureButton

func _input(event):
	#if not self.modulate == HIDDEN:
	if self.name == "ExitGame":
		if event.is_action_pressed("ui_accept"):
			emit_signal("button_down")
			emit_signal("pressed")
