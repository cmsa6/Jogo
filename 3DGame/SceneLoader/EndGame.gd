extends Node

var scene = preload("res://UI/FinalScreen/PlayerFinalContainer.tscn")

func end():
	var rootNode = get_node("/root")
	var finalScreenNode = scene.instance()
	rootNode.add_child(finalScreenNode)
	rootNode.move_child(finalScreenNode,0)
