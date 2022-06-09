extends Node



func end():
	var scene = load("res://UI/FinalScreen/PlayerFinalContainer.tscn")
	var rootNode = get_node("/root")
	var finalScreenNode = scene.instance()
	rootNode.add_child(finalScreenNode)
	rootNode.move_child(finalScreenNode,0)
