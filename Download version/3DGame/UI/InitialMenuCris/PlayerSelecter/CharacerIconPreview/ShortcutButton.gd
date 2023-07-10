extends Button

export (NodePath) var button

func mimic_parent():
	get_node(button).emit_signal("pressed")
	
func mimic_parent_sound():
	get_node(button).emit_signal("button_down")
