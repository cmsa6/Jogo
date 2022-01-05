extends Node

export(String, FILE) var next_scene_path

func load_scene():
	print(next_scene_path)
	if next_scene_path.strip_edges(true, true) != "" && next_scene_path != null:
		var err = get_tree().change_scene(next_scene_path)
		if err:
			push_error("Scene not loaded... Error: " + err)
	else:
		push_error("Scene path invalid. Scene path used: " + next_scene_path)
