extends TextureButton


export(NodePath) var gameTypeSelecterContainer
export(NodePath) var playerSelecterContainer
export(NodePath) var player_placeholder

func go_back():
	print("hellloooooo")
	get_node(gameTypeSelecterContainer).visible = true
	get_node(playerSelecterContainer).visible = false
	
	playerSelecterContainer._ready()
	
	
	
