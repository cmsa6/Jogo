extends TextureButton


func _input(event):
	if event.is_action_pressed("RightArrow"):
		if get_parent().visible:
			emit_signal("button_down")
			emit_signal("pressed")
