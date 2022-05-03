extends Control



onready var cfSkills   = $HBoxContainer2/Control/SkillManager/VBoxContainer/Skills/cfSkills
onready var qolSkills  = $HBoxContainer2/Control/SkillManager/VBoxContainer/Skills/qolSkills
onready var playerName = $HBoxContainer2/HBoxContainer/Label
onready var playerAvatar = $HBoxContainer2/HBoxContainer/Avatar

var playerID setget set_playerID, get_playerID

	
func _ready():
	playerName.text = SavingManager.playersNames[get_playerID()]
	playerAvatar.set_texture(CharactersManager.get_character_icon(SettingsManager.players[get_playerID()-1].character))
	
	var playerQOL = SavingManager.playersQOLSkills[get_playerID()]
	var playerCF = SavingManager.playersCFSkills[get_playerID()]


	
	var nodePath
	for skill in playerCF.keys():
		nodePath = "HBoxContainer2/Control/SkillManager/VBoxContainer/Skills/cfSkills/" + skill
		get_node(nodePath).update_value(playerCF[skill])

	for skill in playerQOL.keys():
		nodePath = "HBoxContainer2/Control/SkillManager/VBoxContainer/Skills/qolSkills/" + skill
		get_node(nodePath).update_value(playerQOL[skill])
		
		
func set_playerID(id):
	playerID = id
	
func get_playerID():
	return playerID


