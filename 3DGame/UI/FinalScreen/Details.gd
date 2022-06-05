extends TextureButton

var playerID setget set_playerID, get_playerID


func show_in_detail():
	get_node("/root/FinalCreen/ColorRect/HBoxContainer/VBoxContainer/ShowAllPlayers").visible = false
	get_node("/root/FinalCreen/ColorRect/HBoxContainer/VBoxContainer/Label").visible = false
	get_node("/root/FinalCreen/ColorRect/ExitGame").visible = false
	get_node("/root/FinalCreen/ColorRect/ExitGame").disabled = true
	var children = get_node("/root/FinalCreen/ColorRect/DetailVersion").get_children()
	var id = get_playerID()
	
	for child in children:
		if child.get_playerID() == id:
			child.show()
			break


func set_playerID(id):
	playerID = id
	
func get_playerID():
	return playerID
