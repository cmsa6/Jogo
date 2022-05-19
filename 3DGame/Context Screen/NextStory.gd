extends TextureButton

signal show_next(currentID)

func _input(event):
	if event.is_action_pressed("Enter") and self.visible:
		emit_signal("button_down")
		emit_signal("pressed")
		


func show_next():
	var num = self.get_name()[-1]
	emit_signal("show_next", num)
	
