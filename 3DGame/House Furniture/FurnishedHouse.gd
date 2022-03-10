extends Spatial

export (Array, String) var availableFurniture = []

onready var avatarIcon = $CanvasLayer/PlayerAvatar
onready var mapButton = $CanvasLayer/MapButton

onready var progressBar = $CanvasLayer2/TextureProgress
onready var tween = $CanvasLayer2/Tween
onready var text = $CanvasLayer2/TextureProgress/ProgressBarText

var finalPlayer  setget set_finalPlayer, get_finalPlayer
var origin setget set_origin, get_origin

onready var players = SettingsManager.players

onready var lattestReward setget set_lattestReward, get_lattestReward



func _ready():
	
	
	
	var parentName = get_parent().name
	if not "Final" in parentName:
		mapButton.set_screenOrigin(get_origin())
		
		
		
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
	var numActives = 0
	for i in range(0,size):
		furniture = availableFurniture[i]
		print("furniture gained: ", furniture)
		pathFurniture = "/root/FurnishedHouse/" + availableFurniture[i]
		
		if playerFurniture[furniture] == 1:
			#progressBar.value += 1
			print("activeee")
			numActives += 1
			if get_lattestReward() == furniture:
				get_node(furniture).stand_out_object(get_origin())
			else:
				get_node(furniture).activate_object()
		else:
			get_node(furniture).deactivate_object()
			
	print("NUM DE ACTIVES: ", numActives)
	text.text = str(numActives) + " / " + str(size) + " OBJECTS"
	tween.interpolate_property(progressBar, "value", numActives - 1, numActives, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
			

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
		get_node(furniture).activate_object()

	
	
	
	
	
func set_finalPlayer(player):
	finalPlayer = player
	
func get_finalPlayer():
	return finalPlayer
	
func set_origin(orig):
	print("setting origin to ", orig)
	origin = orig
	
func get_origin():
	return origin

func set_lattestReward(reward):
	lattestReward = reward
	
func get_lattestReward():
	return lattestReward
