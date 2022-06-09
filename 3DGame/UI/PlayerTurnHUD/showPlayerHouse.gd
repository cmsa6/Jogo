extends TextureButton


onready var houseScene = preload("res://House Furniture/houseWithFurniture.tscn")
onready var current_player = SavingManager.current_player

var playerID setget set_playerID, get_playerID

func set_playerID(id):
	playerID = id
	
func get_playerID():
	return playerID

func _input(event):
#	if not self.disabled:
#		if event.is_action_released("EnterHouse"):
#			if get_playerID() == SavingManager.current_player and event.as_text() == "H":
#				show_house()

	pass
			
#func _process(delta):
#	if Input.is_action_just_released("EnterHouse"):
#		print("im exiting the AVATAR")
#		show_house()
		

func show_house():
	var rootNode = get_node("/root")
	var current_player = SavingManager.current_player

	var canvasNode = get_node("/root/Map1/CanvasLayer")
	canvasNode.enable_additional_info()

	
	var house = houseScene.instance()
	house.set_origin("Map")
	rootNode.add_child(house)
	rootNode.move_child(house,0)


	#Save current Map as global to use later
	var game_node = get_node("/root/Map1")
	SavingManager.saved_scene = game_node 


	if rootNode.is_a_parent_of(game_node):
		rootNode.call_deferred("remove_child", game_node)



