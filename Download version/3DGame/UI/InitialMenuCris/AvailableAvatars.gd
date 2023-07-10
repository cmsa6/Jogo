extends GridContainer


func set_ownership(name):
	for child in get_children():
		if child.get_playerName_visibility() and child.get_playerName() == " ":
			child.set_playerName(name)
