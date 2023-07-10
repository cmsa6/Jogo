extends TextureButton

signal hide_details()



func _input(event):
	if event.is_action_pressed("LeftArrow") and self.visible:
		emit_signal("button_down")
		emit_signal("pressed")


func close_detail():
	get_node("/root/FinalCreen/ColorRect/HBoxContainer/VBoxContainer/ShowAllPlayers").visible  = true
	get_node("/root/FinalCreen/ColorRect/HBoxContainer/VBoxContainer/Label").visible = true
	get_node("/root/FinalCreen/ColorRect/ExitGame").visible  = true
	get_node("/root/FinalCreen/ColorRect/ExitGame").disabled = false
	emit_signal("hide_details")


