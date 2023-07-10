extends TextureButton


export(NodePath) var gameTypeSelecterContainer
export(NodePath) var playerSelecterContainer
export(NodePath) var player_placeholder

func go_back():
	get_tree().change_scene("res://UI/InitialMenuCris/InitialMenu.tscn")
	SavingManager.playersNames = {}

	
	
	
