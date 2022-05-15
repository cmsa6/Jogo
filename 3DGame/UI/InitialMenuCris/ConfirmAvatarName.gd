extends TextureButton


func _input(event):
	if event.is_action_pressed("Enter") and not self.disabled and visible:
		emit_signal("button_down")
		emit_signal("pressed")
