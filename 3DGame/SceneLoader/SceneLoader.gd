extends Node

export(String, FILE) var next_scene_path

func load_scene():
	print(next_scene_path)
	if next_scene_path.strip_edges(true, true) != "" && next_scene_path != null:
		
		if "Final" in next_scene_path:
			var rootNode = get_node("/root")
			var gameNode = get_node("/root/Map1")
			if rootNode.is_a_parent_of(gameNode):
				rootNode.call_deferred("remove_child", gameNode)
		var err = get_tree().change_scene(next_scene_path)
		
		if err:
			push_error("Scene not loaded... Error: " + str(err))
	else:
		push_error("Scene path invalid. Scene path used: " + str(next_scene_path))



