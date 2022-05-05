extends TextureButton

signal hide_details()


func close_detail():
	get_node("/root/FinalCreen/ColorRect/HBoxContainer/VBoxContainer/ShowAllPlayers").visible  = true
	get_node("/root/FinalCreen/ColorRect/ExitGame").visible  = true
	get_node("/root/FinalCreen/ColorRect/ExitGame").disabled = false
	emit_signal("hide_details")


