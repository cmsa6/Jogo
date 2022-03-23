extends VBoxContainer


export(NodePath) var confirmCharacterButton


onready var avatarPictures = $AvailableAvatars
onready var avatarName = $AvatarName
onready var confirmName = $ConfirmAvatarName
onready var confirmCharacter = $confirm
onready var instructions = $ColorRect/Instructions

const VISIBLE = Color(1, 1, 1, 1)
const HIDDEN = Color(1, 1, 1, 0)

var playerID = -1 setget set_playerID, get_playerID

func set_playerName():
	avatarPictures.visible = false
	avatarName.visible = true
	confirmName.visible = true
	get_node(confirmCharacterButton).disabled = true
	get_node(confirmCharacterButton).modulate = HIDDEN
	instructions.text = "Choose Your Character's Name"
	
	
func show_characters(): 
	avatarPictures.visible = true
	avatarName.visible = false
	confirmName.visible = false
	get_node(confirmCharacterButton).disabled = false
	get_node(confirmCharacterButton).modulate = VISIBLE
	instructions.text = "Choose Your Character"
	
func register_name():
	var name = avatarName.text
	name = name.replace("\n", "")
	var playerNum = get_playerID()
	print(playerNum)
	if playerNum != -1:
		SavingManager.playersNames[playerNum] = avatarName.text
	avatarName.clear()
	show_characters()

func set_playerID(id):
	playerID = id
	
func get_playerID():
	return playerID
	



