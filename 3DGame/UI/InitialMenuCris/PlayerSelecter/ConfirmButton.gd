extends TextureButton

func _input(event):
	if Input.is_key_pressed(KEY_SPACE):
		emit_signal("pressed")

func _on_Button_pressed():
	disabled = false
