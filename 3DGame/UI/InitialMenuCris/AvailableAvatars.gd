extends GridContainer


func set_ownership(name):
	print("setting ownershipppppppp")
	for child in get_children():
		print(child.get_name())
		print(child.get_playerName_visibility())
		print(child.get_playerName())
		if child.get_playerName_visibility() and child.get_playerName() == " ":
			print("entre")
			child.set_playerName(name)
