extends Control


onready var qol = $ColorRect/VBoxContainer/Skills/qolSkills
onready var cf = $ColorRect/VBoxContainer/Skills/cfSkills


func set_up(playerID):
	var playerQOL = SavingManager.playersQOLSkills[playerID]
	var playerCF = SavingManager.playersCFSkills[playerID]
	
	var qolSkills = playerQOL.keys()
	var cfSkills = playerCF.keys()
	
	var nodePath
	for skill in qolSkills:
		nodePath = "ColorRect/VBoxContainer/Skills/qolSkills/" + skill
		get_node(nodePath).update_value(playerQOL[skill])
		
	for skill in cfSkills:
		nodePath = "ColorRect/VBoxContainer/Skills/cfSkills/" + skill
	
		get_node(nodePath).update_value(playerCF[skill])
