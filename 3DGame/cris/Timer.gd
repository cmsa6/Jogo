extends Timer

func test():
	var root_node = get_node("/root")

	var playScreen = load("res://UI/Dice/DicePreview.tscn")
	var play_node = playScreen.instance()
	root_node.add_child(play_node)
	root_node.move_child(play_node,0)
	
	self.stop()
	
	
