extends TextureButton

func _input(event):
	if event.is_action_pressed("ui_accept") and not self.disabled:
		emit_signal("pressed")

func _on_Button_pressed():
	disabled = false
	visible = true
