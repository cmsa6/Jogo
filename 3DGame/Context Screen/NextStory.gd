extends TextureButton

signal show_next(currentID)

func _input(event):
	if event.is_action_pressed("ui_select") and self.visible:
		emit_signal("pressed")
		


func show_next():
	print("hello")
	var num = get_parent().get_name()[-1]
	emit_signal("show_next", num)
	
