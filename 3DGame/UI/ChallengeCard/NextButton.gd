extends TextureButton

func _input(event):
	if event.is_action_pressed("Escape") and self.visible:
		emit_signal("button_down")
		emit_signal("pressed")
