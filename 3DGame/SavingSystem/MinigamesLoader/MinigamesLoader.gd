extends Node

export (Array, String, FILE) var minigames = []

var rng = RandomNumberGenerator.new()

func _on_load_minigame():
	var root_node = get_node("/root") 

	# Load mini game
	var minigame_node = load(minigames[choose_random_minimgame()])
	minigame_node = minigame_node.instance()
	root_node.add_child(minigame_node)

	#Save current Map as global to use later
	var game_node = get_node("/root/Map1")
	SavingManager.saved_scene = game_node  
	if root_node.is_a_parent_of(game_node):
		root_node.call_deferred("remove_child", game_node)

func choose_random_minimgame():
	rng.randomize()
	return rng.randi_range(0, minigames.size() - 1)
