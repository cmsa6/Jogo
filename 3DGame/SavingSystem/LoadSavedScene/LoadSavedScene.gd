extends Node

func load_saved_scene():
	var root_node = get_node("/root")
	
	# Load saved scene
	var saved_scene = SavingManager.saved_scene
	root_node.add_child(saved_scene)
	
	# Delete current scene
	var current_Scene = get_node("/root/Example1")
	current_Scene.queue_free()
