extends Node

var rng = RandomNumberGenerator.new()
signal disable_buttons
signal enable_buttons


func _on_load_minigame():
	

	var root_node = get_node("/root")
	emit_signal("disable_buttons")
	
	

	# Load mini game
	#var minigame_node = load(minigames[choose_random_minimgame()])
	var minigame_node = load("res://UI/ChallengeCard/CardPreview.tscn")
	minigame_node = minigame_node.instance()
	root_node.add_child(minigame_node)
	root_node.move_child(minigame_node,0)

	

