extends TextureButton

export (String, FILE) var previousScene



func _on_BackButton_pressed():
	get_tree().change_scene(previousScene)
	
		
		
func back_to_game():
	get_tree().change_scene(previousScene)
	var root_node = get_node("/root")
	var children = get_node("/root").get_children()
	print(children)
	var extraChildren = len(children) - 6
	for i in range (6, len(children)):
		print(children[-1])
		root_node.remove_child(root_node.get_children()[-1])
		
	print(root_node.get_children())
