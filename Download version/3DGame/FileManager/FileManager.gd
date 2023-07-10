extends Node

func backup_cards():
	make_cards_dir_user()
	copy_cards_to_user("HELP")
	copy_cards_to_user("COMMERCIAL")
	copy_cards_to_user("SERVICES")
	copy_cards_to_user("LEISURE")
	copy_images_to_user()
	
	
func images():
	var files = []
	var photoDir = "res://Cards/" + str(SettingsManager.language) + "/Photos/"
	var dir = Directory.new()
	dir.open(photoDir)
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()
	
	
	
	
func make_cards_dir_user():
	var dir = Directory.new()
	dir.open("user://")
	if not dir.dir_exists("user://Cards"):
		dir.make_dir("Cards")
	
	var cardsDir = Directory.new()
	cardsDir.open("user://Cards")
	var path = "user://Cards/" + str(SettingsManager.language)
	
	if not cardsDir.dir_exists(str(SettingsManager.language)):
		cardsDir.make_dir(str(SettingsManager.language))
	
func copy_images_to_user():
	var language = str(SettingsManager.language)
	
	var photosDir = Directory.new()
	var languageDir = "user://Cards/" + language
	photosDir.open(languageDir)
	if not photosDir.dir_exists("photos"):
		photosDir.make_dir("photos")
	

	var destDir = Directory.new()

	
	var folderName = "res://Cards/" + language + "/Photos/"
	var destFolderName = "user://Cards/" + language + "/photos/"
	
	
	destDir.open(destFolderName)
	var array = []
	var dir = Directory.new()
	dir.open(folderName)
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
		var fileName = folderName
		var destFileName = destFolderName

		if file == "":
			break
		elif not file.begins_with("."):
			fileName = fileName + file
			destFileName = destFileName + file
			destDir.copy(fileName, destFileName)

func copy_cards_to_user(zone):	
	var language = str(SettingsManager.language)
	var cardsDir = Directory.new()
	var langDir = "user://Cards/" + language
	cardsDir.open(langDir)
	if not cardsDir.dir_exists(zone):
		cardsDir.make_dir(zone)
	
		var destDir = Directory.new()
		var folderName = "res://Cards/"+ language + "/"+ zone + "/"
		var destFolderName = "user://Cards/" + language + "/" + zone + "/"

		
		destDir.open(destFolderName)
		var array = []
		var dir = Directory.new()
		dir.open(folderName)
		dir.list_dir_begin()
		
		while true:
			var file = dir.get_next()
			var fileName = folderName
			var destFileName = destFolderName
			if file == "":
				break
			elif not file.begins_with("."):
				fileName = fileName + file
				destFileName = destFileName + file
				destDir.copy(fileName, destFileName)
