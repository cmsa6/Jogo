extends TextureButton


func _input(event):
	#if Input.is_key_pressed(KEY_SPACE):
	if event.is_action_pressed("final_scree_ui"):
		if event.as_text() == "A" and self.name == "Objects":
			emit_signal("pressed")
		elif event.as_text() == "B" and self.name == "Points":
			emit_signal("pressed")
