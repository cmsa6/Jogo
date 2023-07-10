extends Node

export (Array, String, FILE) var minigames = []

var rng = RandomNumberGenerator.new()
signal disable_buttons



func _on_load_minigame(type):
	var root_node = get_node("/root") 
	emit_signal("disable_buttons")
	
	var game_node = get_node("/root/Map1")
	SavingManager.saved_scene = game_node 

	
	var minigame_node = load("res://UI/ChallengeCard/CardPreview.tscn")
	minigame_node = minigame_node.instance()
	minigame_node.set_type(type)
	root_node.add_child(minigame_node)
	root_node.move_child(minigame_node,0)

	


func choose_random_minimgame():
	rng.randomize()
	return rng.randi_range(0, minigames.size() - 1)
