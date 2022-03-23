extends VBoxContainer

onready var playerName = $HBoxContainer/Label
onready var playerAvatar = $HBoxContainer/Avatar
onready var house = $Control/ViewportContainer/FinalViewport/FurnishedHouse

onready var numObjects = $Control/Buttons/Objects/ObjectsText
onready var numPoints = $Control/Buttons/Points/PointsText

onready var control = $Control




func _ready():
	pass



func show_houses(playerFurniture, playerID):
	control.set_playerID(playerID)
	#playerName.text = "Jogador " + str(playerID)
	var name = SavingManager.playersNames[playerID]
	if name == "" or name == " ":
		playerName.text = "Jogador " + str(playerID)
	else:
		playerName.text = name
		
	
	playerAvatar.set_texture(CharactersManager.get_character_icon(SettingsManager.players[playerID-1].character))
	house.show_final_house(playerFurniture)
	var numObjs = check_objects(playerFurniture)
	numObjects.text = str(numObjs) + " OBJECTS"
	numPoints.text = str(SavingManager.playersSkillScores[playerID]) + " POINTS"
	
	

func check_objects(furnitures):
	var values = furnitures.values()
	var total = 0
	
	for v in values:
		total = total + v
	return total
