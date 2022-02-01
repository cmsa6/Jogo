extends Node

func load_saved_scene():
	var root_node = get_node("/root")
	
	print(root_node.get_children()) 
	print(root_node.get_children()[0].get_children())
	
	# Load saved scene
	var saved_scene = SavingManager.saved_scene
	root_node.add_child(saved_scene)
	
	print(saved_scene)
	
	# Delete current scene
	#var current_Scene = get_node("/root/Example1")
	#print("current-----")
	#print(get_node("/root").get_path())
	
	#var children = get_node("/root").get_children()
	#for i in children:
	#	print(i.get_name())
	#print("children ended")

	
	
	
	#print(current_Scene.get_path())
	#var current_Scene = get_node("/root/CardPreview")
	#current_Scene.queue_free()
	var current_Scene2 = get_node("/root/EvaluateCard")
	current_Scene2.queue_free()

	
	
	#var saved_scene = SavingManager.saved_scene
	#get_tree().get_root().add_child(saved_scene)
	#get_tree().get_root().call_deferred("remove_child", get_tree().get_root().get_children()[0])


