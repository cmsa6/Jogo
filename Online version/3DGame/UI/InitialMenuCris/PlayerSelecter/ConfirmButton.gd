extends TextureButton

func _input(event):
	if event.is_action_pressed("RightArrow") and visible: #not self.disabled:
		emit_signal("button_down")
		emit_signal("pressed")

func _on_Button_pressed():
	disabled = false
	visible = true