extends Node

func load_saved_scene():
	var root_node = get_node("/root")
	

	
	# Load saved scene
	var saved_scene = SavingManager.saved_scene
	root_node.add_child(saved_scene)
	

	var current_Scene2 = get_node("/root/EvaluateCard")
	current_Scene2.queue_free()

	



