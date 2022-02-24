extends Spatial

export (Array, String) var availableFurniture = []

onready var avatarIcon = $CanvasLayer/PlayerAvatar
onready var mapButton = $CanvasLayer/MapButton

var finalPlayer  setget set_finalPlayer, get_finalPlayer

onready var players = SettingsManager.players



func _ready():
	var parentName = get_parent().name
	if not "Final" in parentName:
		var currentPlayer = SavingManager.current_player
		
		avatarIcon.set_texture(CharactersManager.get_character_icon(SettingsManager.players[currentPlayer].character))

		var spawners =  get_node("/root/Map1/Spawners").get_children()
		#var mapChildren = mapNode.get_children()

		#for child in mapChildren:
			#if child.get_name() == "Spawners":
			#	for player in child.get_children():
#		var playersNodes = players.get_children()
#		var numPlayers = players.size()
#		for i in range(0, numPlayers):
		for player in spawners:
			
			if currentPlayer == ( player.get_player_num() - 1 ):
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
		print("furniture gained: ", furniture)
		pathFurniture = "/root/FurnishedHouse/" + availableFurniture[i]
		
		if playerFurniture[furniture] == 1:
			get_node(furniture).activateObject()
		else:
			get_node(furniture).deactivateObject()
			

func show_final_house(playerID):
	avatarIcon.visible = false
	mapButton.visible = false
	
	#var spawners =  get_node("/root/Map1/Spawners").get_children()
	#var allPlayers = SavingManager.winning_players

	#for player in allPlayers:
	#	if playerID == (player.get_player_num() - 1):
	#		var activeFurnitures = player.get_gained_furniture()
	#		checkActives(activeFurnitures)
	var size = availableFurniture.size()
	var furniture

	for i in range(0,size):
		furniture = availableFurniture[i]
		get_node(furniture).activateObject()

	
	
	
	
	
func set_finalPlayer(player):
	finalPlayer = player
	
func get_finalPlayer():
	return finalPlayer
