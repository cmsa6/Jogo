extends Node

var COMMERCIAL_challenges = []
var LEISURE_challenges = []
var HELP_challenges = []
var SERVICES_challenges = []

func register_cards(folder):
	var array
	if folder == "COMMERCIAL":
		array = COMMERCIAL_challenges 
	elif folder == "LEISURE":
		array = LEISURE_challenges 
	elif folder == "HELP":
		array = HELP_challenges 
	elif folder == "SERVICES":
		array = SERVICES_challenges 
		
	var language = SettingsManager.language
	var dir = Directory.new()
	var folderName = "res://Cards/"+ str(language) + "/"+ folder + "/"

	dir.open(folderName)
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			
			array.append(file)
			

	
	
		
