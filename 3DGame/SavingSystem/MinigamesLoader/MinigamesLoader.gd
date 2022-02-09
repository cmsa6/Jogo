extends Node

export (Array, String, FILE) var minigames = []

var rng = RandomNumberGenerator.new()
signal disable_buttons



func _on_load_minigame(type):
	print(type)
	

	var root_node = get_node("/root") 
	emit_signal("disable_buttons")
	
	var game_node = get_node("/root/Map1")
	SavingManager.saved_scene = game_node 

	# Load mini game
	#var minigame_node = load(minigames[choose_random_minimgame()])
	var minigame_node = load(minigames[1])
	minigame_node = minigame_node.instance()
	root_node.add_child(minigame_node)
	root_node.move_child(minigame_node,0)

	#Save current Map as global to use later
	#var game_node = get_node("/root/Map1")
	#SavingManager.saved_scene = game_node 
	
	
	#if root_node.is_a_parent_of(game_node):
	#	root_node.call_deferred("remove_child", game_node)
	#	print("i have removed the child")
		
	print(root_node.get_children())
	print(root_node.get_children()[0].get_children())
	print(root_node.get_children()[4].get_children())

func choose_random_minimgame():
	rng.randomize()
	return rng.randi_range(0, minigames.size() - 1)
