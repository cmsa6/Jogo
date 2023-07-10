extends VBoxContainer


export(NodePath) var confirmCharacterButton
export(NodePath) var playerName

export(NodePath) var translationManager


onready var avatarPictures = $AvailableAvatars
onready var avatarName = $AvatarName
onready var confirmName = $ConfirmAvatarName
onready var instructions = $ColorRect/Instructions

const VISIBLE = Color(1, 1, 1, 1)
const HIDDEN = Color(1, 1, 1, 0)

var playerID = -1 setget set_playerID, get_playerID

func check_player_name():
	var playerNum = get_playerID()
	var name = get_node(playerName).get_placeholder()
	
	if playerNum == -1:
		return name + str(playerNum+2)
	else:
		return name.replace(str(playerNum), str(playerNum+1)) 

func set_playerName():
	avatarPictures.visible = false
	avatarName.visible = true
	avatarName.clear()
	avatarName.grab_focus()
	confirmName.visible = true
	get_node(confirmCharacterButton).disabled = true
	get_node(confirmCharacterButton).modulate = HIDDEN
	get_node(translationManager).translate_instructions_name()
	
	var placeholderName = check_player_name()
	avatarName.set_placeholder(placeholderName)
	
func show_characters(name): 
	avatarPictures.visible = true
	avatarPictures.set_ownership(name)
	avatarName.visible = false
	confirmName.visible = false
	get_node(confirmCharacterButton).disabled = false
	get_node(confirmCharacterButton).modulate = VISIBLE
	get_node(translationManager).translate_instructions()
	
func register_name():
	var name = avatarName.text
	name = name.replace("\n", "")
	var nameWithoutSpaces = name.replace(" ","")
	var playerNum = get_playerID()
	var playerName

	if playerNum != -1:
		if name == "" or name == " " or nameWithoutSpaces == "":
			playerName = avatarName.get_placeholder()
		else:
			playerName = name
		SavingManager.playersNames[playerNum] = playerName


	if playerNum < SettingsManager.num_of_players:
		show_characters(playerName)

func set_playerID(id):
	playerID = id
	
func get_playerID():
	return playerID
	



