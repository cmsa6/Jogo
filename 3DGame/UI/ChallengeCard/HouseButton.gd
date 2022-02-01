extends TextureButton

var houseScene = preload("res://House Furniture/houseWithFurniture.tscn")

func show_house():
	
	var rootNode = get_node("/root")
	var current_player = SavingManager.current_player
	
	var canvasNode = get_node("/root/Map1/CanvasLayer")
	canvasNode.enable_canvas()
	
	var currentCard = rootNode.get_child(0)
	currentCard.queue_free()
	
	var house = houseScene.instance()
	rootNode.add_child(house)
	rootNode.move_child(house,0)
	
	#Save current Map as global to use later
	var game_node = get_node("/root/Map1")
	SavingManager.saved_scene = game_node 
	
	
	if rootNode.is_a_parent_of(game_node):
		rootNode.call_deferred("remove_child", game_node)


	
