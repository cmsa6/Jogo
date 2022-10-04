extends TextureButton


func _input(event):
	if event.is_action_pressed("Space"):
		emit_signal("button_down")
		emit_signal("pressed")
