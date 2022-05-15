extends Button


func mimic_parent():
	get_parent().get_parent().emit_signal("pressed")
	
func mimic_parent_sound():
	get_parent().get_parent().emit_signal("button_down")
	
	
	



