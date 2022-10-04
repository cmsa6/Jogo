extends Node

var COMMERCIAL_challenges 
var LEISURE_challenges 
var HELP_challenges 
var SERVICES_challenges 
var lastId setget set_lastId, get_lastId

func register_cards(folder):
	var array
	if folder == "COMMERCIAL":
		COMMERCIAL_challenges  = []
		array = COMMERCIAL_challenges 
		
	elif folder == "LEISURE":
		LEISURE_challenges = []
		array = LEISURE_challenges 
		
	elif folder == "HELP":
		HELP_challenges = []
		array = HELP_challenges 
		
	elif folder == "SERVICES":
		SERVICES_challenges = []
		array = SERVICES_challenges 
		
	var language = SettingsManager.language
	var dir = Directory.new()
	var folderName = "user://Cards/"+ str(language) + "/"+ folder + "/"
	print("does folder exists?: ", dir.file_exists("user://Cards/"+ str(language) + "/"+ folder))
	dir.open(folderName)
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			
			array.append(file)
			

			

	

		
func set_lastId(id):
	lastId = id
	
	
func get_lastId():
	return lastId
	
	

	
