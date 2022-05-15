extends Spatial

export (Array, String) var availableFurniture = []

onready var avatarIcon = $CanvasLayer/Control/VBoxContainer2/VBoxContainer/PlayerAvatar
onready var avatarName = $CanvasLayer/Control/VBoxContainer2/VBoxContainer/ColorRect/PlayerName

onready var newMapButton = $CanvasLayer/Control2/ScoreInfoManager/NewMapButton

onready var progressBar = $CanvasLayer/Control2/ScoreInfoManager/TextureProgress
onready var tween = $CanvasLayer/Control2/ScoreInfoManager/Tween
onready var text = $CanvasLayer/Control2/ScoreInfoManager/TextureProgress/ProgressBarText

#onready var pointsBarText = $ScoreInfo/ScoreInfoManager/PointsBar/Points
onready var pointsBar = $CanvasLayer/Control/VBoxContainer2/PointsBar
#onready var pointsBar = $CanvasLayer/Control/VBoxContainer2/PointsBar

onready var scoreInfoManager = $CanvasLayer/Control2/ScoreInfoManager






var finalPlayer  setget set_finalPlayer, get_finalPlayer
var origin setget set_origin, get_origin



onready var players = SettingsManager.players

onready var lattestReward setget set_lattestReward, get_lattestReward



func _ready():

	
	var parentName = get_parent().name
	if not "Final" in parentName:
		#mapButton.set_screenOrigin(get_origin())
		newMapButton.set_screenOrigin(get_origin())
		
		
		
		var currentPlayer = SavingManager.current_player
		
		avatarIcon.set_texture(CharactersManager.get_character_icon(SettingsManager.players[currentPlayer].character))
		avatarName.text = SavingManager.playersNames[currentPlayer+1]

		var spawners =  get_node("/root/Map1/Spawners").get_children()

		for player in spawners:

			if currentPlayer == ( player.get_player_num() - 1 ):
				var activeFurnitures = player.get_gained_furniture()
				checkActives(activeFurnitures)
				show_points(player.get_totalPoints())

				pointsBar.set_QOLPoints(player.get_QOLPoints())
				pointsBar.set_CFPoints(player.get_CFPoints())
				break
						
	


func checkActives(playerFurniture):
	var size = availableFurniture.size()
	var furniture
	var pathFurniture
	var numActives = 0
	for i in range(0,size):
		furniture = availableFurniture[i]
	
		pathFurniture = "/root/FurnishedHouse/" + availableFurniture[i]
		
		if playerFurniture[furniture] == 1:
			#progressBar.value += 1
			
			numActives += 1
			if get_lattestReward() == furniture:
				get_node(furniture).stand_out_object(get_origin())
			else:
				get_node(furniture).activate_object()
		else:
			get_node(furniture).deactivate_object()
			

	

	
	text.text = str(numActives) + " / " + str(size) + text.text
	tween.interpolate_property(progressBar, "value", numActives - 1, numActives, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
	
			

func show_final_house(playerFurnitures):
	
#	avatarIcon.visible = false
#	mapButton.visible = false
	
	
	#var spawners =  get_node("/root/Map1/Spawners").get_children()
	#var allPlayers = SavingManager.winning_players

	#for player in allPlayers:
	#	if playerID == (player.get_player_num() - 1):
	#		var activeFurnitures = player.get_gained_furniture()
	#		checkActives(activeFurnitures)

	
	var furnitures = playerFurnitures.keys()
	
	for f in furnitures:
		if playerFurnitures[f] == 1:
			get_node(f).activate_object()
		elif playerFurnitures[f] == 0:
			get_node(f).deactivate_object()
			
	
		
		
	

	
	
	
	
	
func set_finalPlayer(player):
	finalPlayer = player
	
func get_finalPlayer():
	return finalPlayer
	
func set_origin(orig):
	origin = orig
	
func get_origin():
	return origin

func set_lattestReward(reward):
	lattestReward = reward
	
func get_lattestReward():
	return lattestReward
	
func show_points(points):
	#pointsBarText.text = str(points) + " POINTS"
	pass
	
func hide_extra_info():
	avatarIcon.visible = false
	scoreInfoManager.visible = false
	progressBar.visible = false
	newMapButton.visible = false
	
	
#func get_pointsBar_object():
#	return pointsBar
	
	

