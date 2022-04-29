extends VBoxContainer


export(NodePath) var confirmCharacterButton
export(NodePath) var playerName

export(NodePath) var translationManager


onready var avatarPictures = $AvailableAvatars
onready var avatarName = $AvatarName
onready var confirmName = $ConfirmAvatarName
onready var confirmCharacter = $confirm
onready var instructions = $ColorRect/Instructions

const VISIBLE = Color(1, 1, 1, 1)
const HIDDEN = Color(1, 1, 1, 0)

var playerID = -1 setget set_playerID, get_playerID

func check_player_name():
	var playerNum = get_playerID()
	print("id do player: ",playerNum)
	var name = get_node(playerName).get_placeholder()
	
	if playerNum == -1:
		return name + str(playerNum+2)
	else:
		return name.replace(str(playerNum), str(playerNum+1)) 

func set_playerName():
	avatarPictures.visible = false
	avatarName.visible = true

	avatarName.grab_focus()
	confirmName.visible = true
	get_node(confirmCharacterButton).disabled = true
	get_node(confirmCharacterButton).modulate = HIDDEN
	#instructions.text = "Choose Your Character's Name"
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
	#instructions.text = "Choose Your Character"
	get_node(translationManager).translate_instructions()
	
func register_name():
	var name = avatarName.text
	name = name.replace("\n", "")
	var nameWithoutSpaces = name.replace(" ","")
	var playerNum = get_playerID()
	var playerName
	print(playerNum)
	print("name: ", name)
	if playerNum != -1:
		if name == "" or name == " " or nameWithoutSpaces == "":
			#playerName = "Player " + str(playerNum)
			playerName = avatarName.get_placeholder()
		else:
			playerName = name
		SavingManager.playersNames[playerNum] = playerName

	avatarName.clear()
	if playerNum < SettingsManager.num_of_players:
		show_characters(playerName)

func set_playerID(id):
	print("seting playerID in costumization to: ", id)
	playerID = id
	
func get_playerID():
	return playerID
	



