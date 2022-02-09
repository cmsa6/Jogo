extends Spatial

export (Array, String) var availableFurniture = []


func _ready():
	var currentPlayer = SavingManager.current_player
	
	var mapNode =  get_node("/root/Map1")
	var mapChildren = mapNode.get_children()
	
	for child in mapChildren:
		if child.get_name() == "Spawners":
			for player in child.get_children():
				if currentPlayer == (player.get_player_num() - 1):
					var activeFurnitures = player.get_gained_furniture()
					print(activeFurnitures)
					checkActives(activeFurnitures)
					break


func checkActives(playerFurniture):
	var size = availableFurniture.size()
	var furniture
	var pathFurniture
	for i in range(0,size):
		furniture = availableFurniture[i]
		pathFurniture = "/root/FurnishedHouse/" + availableFurniture[i]
		
		if playerFurniture[furniture] == 1:
			get_node(furniture).activateObject()
		else:
			get_node(furniture).deactivateObject()
			