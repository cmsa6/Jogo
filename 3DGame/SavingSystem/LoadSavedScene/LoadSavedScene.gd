extends Node

func load_saved_scene():
	var root_node = get_node("/root")
	
	print(root_node.get_children()) 
	print(root_node.get_children()[0].get_children())
	
	# Load saved scene
	var saved_scene = SavingManager.saved_scene
	root_node.add_child(saved_scene)
	
	# Delete current scene
	var current_Scene = get_node("/root/Example1")
	current_Scene.queue_free()

	
	
	#var saved_scene = SavingManager.saved_scene
	#get_tree().get_root().add_child(saved_scene)
	#get_tree().get_root().call_deferred("remove_child", get_tree().get_root().get_children()[0])

	print(root_node.get_children()) 
	print(root_node.get_children()[0].get_children())
