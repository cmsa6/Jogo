extends VBoxContainer

onready var playerName = $HBoxContainer/Label
onready var playerAvatar = $HBoxContainer/Avatar
onready var house = $Control/ViewportContainer/FinalViewport/FurnishedHouse

onready var numObjects = $Buttons/Objects/ObjectsText
onready var numPoints = $Buttons/Points/PointsText

onready var control = $Control

onready var objectsButton = $Buttons/Objects

onready var translator = $TranslationManager




func _ready():
	objectsButton.pressed = true
	objectsButton.disabled = true



func show_houses(playerFurniture, playerID):
	control.set_playerID(playerID)
	playerName.text = SavingManager.playersNames[playerID]

		
	
	playerAvatar.set_texture(CharactersManager.get_character_icon(SettingsManager.players[playerID-1].character))
	house.show_final_house(playerFurniture)
	var numObjs = check_objects(playerFurniture)

	
	translator.translate_total(str(numObjs), str(SavingManager.playersSkillScores[playerID]))
	
	

func check_objects(furnitures):
	var values = furnitures.values()
	var total = 0
	
	for v in values:
		total = total + v
	return total
