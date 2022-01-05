extends Node

func load_saved_scene():
	var root_node = get_node("/root")  #need this as get_node will stop work once you remove your self from the Tree
	
	var current_Scene = get_node("/root/Node2D")
	root_node.remove_child(current_Scene)
	current_Scene.call_deferred("free")

	var NextScene = SavingManager.saved_scene
	root_node.add_child(NextScene)
