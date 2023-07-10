extends Control


#onready var qol = $ColorRect/VBoxContainer/Skills/qolSkills
#onready var cf = $ColorRect/VBoxContainer/Skills/cfSkills

onready var qol = $ColorRect/VBoxContainer/Skills/QOL/TotalQOL
onready var cf = $ColorRect/VBoxContainer/Skills/CF/TotalCF

onready var details = $ColorRect/VBoxContainer/Details

onready var translator = $TranslationManager


func set_up(playerID):
	var playerQOL = SavingManager.playersQOLSkills[playerID]
	var playerCF = SavingManager.playersCFSkills[playerID]
	details.set_playerID(playerID)
	
#	var qolSkills = playerQOL.keys()
#	var cfSkills = playerCF.keys()
	
#	var nodePath
#	for skill in qolSkills:
#		nodePath = "ColorRect/VBoxContainer/Skills/qolSkills/" + skill
#		get_node(nodePath).update_value(playerQOL[skill])
#
#	for skill in cfSkills:
#		nodePath = "ColorRect/VBoxContainer/Skills/cfSkills/" + skill
#
#		get_node(nodePath).update_value(playerCF[skill])

	var qolValues = playerQOL.values()
	var cfValues  = playerCF.values()
	
	var qolTotal = 0
	var cfTotal  = 0
	
	for v in qolValues:
		qolTotal += v
	#qol.text = str(qolTotal) + cf.text 
		
	for v in cfValues:
		cfTotal += v	
	#cf.text = str(cfTotal) + cf.text 
	
	translator.translate(qolTotal, cfTotal)

	
	

	
	
	
	
