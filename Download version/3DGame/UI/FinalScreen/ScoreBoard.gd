extends Control


onready var qol = $ColorRect/VBoxContainer/Skills/QOL/TotalQOL
onready var cf = $ColorRect/VBoxContainer/Skills/CF/TotalCF

onready var details = $ColorRect/VBoxContainer/Details

onready var translator = $TranslationManager


func set_up(playerID):
	var playerQOL = SavingManager.playersQOLSkills[playerID]
	var playerCF = SavingManager.playersCFSkills[playerID]
	details.set_playerID(playerID)
	

	var qolValues = playerQOL.values()
	var cfValues  = playerCF.values()
	
	var qolTotal = 0
	var cfTotal  = 0
	
	for v in qolValues:
		qolTotal += v

		
	for v in cfValues:
		cfTotal += v	

	translator.translate(qolTotal, cfTotal)

	
	

	
	
	
	
