extends TextureButton


func _input(event):
	if event.is_action_pressed("Evaluate"):
		if self.name == "ApproveButton" and event.as_text() == "A":
			emit_signal("button_down")
			emit_signal("pressed")
		if self.name == "DisapproveButton" and event.as_text() == "B":
			emit_signal("button_down")
			emit_signal("pressed")
