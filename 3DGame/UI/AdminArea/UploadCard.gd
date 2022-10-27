extends Control

onready var imagePath      = $ColorRect/VBoxContainer/GridContainer/HBoxContainer2/ImagePath
onready var filePath       = $ColorRect/VBoxContainer/GridContainer/HBoxContainer3/FilePath
onready var mapZones       = $ColorRect/VBoxContainer/GridContainer/MapZones

onready var mapZoneAsterisc = $ColorRect/VBoxContainer/GridContainer/MapZonesAsteric
onready var imageAsterisc  = $ColorRect/VBoxContainer/GridContainer/ImageAsterisc
onready var fileAsterisc = $ColorRect/VBoxContainer/GridContainer/FileAsterisc

onready var fileSelected setget set_fileSelected, get_fileSelected
onready var imageSelected setget set_imageSelected, get_imageSelected

func submit():
	if check_fields():	
		var fileId = 0
		var incLastId = ChallengesManager.lastId + 1
		fileId = "extra_" + str(incLastId)
		ChallengesManager.set_lastId(incLastId)
		
		
		var imagePath = save_image(fileId)
		
		
		

	#how_result(cardTitle, cardDescription, imagePath, zone, cardScore, skill, skillTranslated)

		
	
func save_image(fileId):
	var image = get_imageSelected()
	#var fileId = image.get_extension()
	#print("im editing file #", fileId)
	if image != "NA":
		var photosFolder
		photosFolder = "user://Cards/" + SettingsManager.language + "/photos/extra_" + str(fileId) + "." + image.get_extension() 
		var dir = Directory.new()
		dir.copy(image, photosFolder)
		return photosFolder
		
		
func save_file(fileId):
	var file = get_fileSelected()
	#var fileId = image.get_extension()
	#print("im editing file #", fileId)
	if file != "NA":
		var cardsFolder
		cardsFolder = "user://Cards/" + SettingsManager.language + "/" + check_mapZone() + "/extra_" + str(fileId) + "." + file.get_extension() 
		var dir = Directory.new()
		dir.copy(file, cardsFolder)
		return cardsFolder


func _on_FileDialog_image_selected(path):
	set_imageSelected(path)
#	var imageName = path.split("\/")
#	imagePath.text = imageName[-1]
	print(path)
	

	
func _on_FileDialog_file_selected(path):
	set_fileSelected(path)
	print(path)
	
func set_fileSelected(f):
	fileSelected = f
	
func get_fileSelected():
	return fileSelected
	
func set_imageSelected(img):
	imageSelected = img
	
func get_imageSelected():
	return imageSelected
	
func check_mapZone():
	var id = mapZones.get_selected_id()

	match id:
		0: return "NA"
		1: return "HELP"
		2: return "SERVICES"
		3: return "COMMERCIAL"
		4: return "LEISURE"	
		
		
func check_mapId(zone):
	match zone:
		"NA"         : return 0
		"HELP"       : return 1
		"SERVICES"   : return 2
		"COMMERCIAL" : return 3
		"LEISURE"    : return 4	
	
		
		
	

		

		
			
		

	



func check_fields():
	var isMapZoneSelected     = check_selected_mapZone()
	var isFileSelected       = check_selected_file()
	var isImageSelected       = check_selected_image()

	
	return isMapZoneSelected*isFileSelected*isImageSelected
	
	
	
	
	
func check_selected_mapZone():
	if mapZones.get_selected_id() == 0 or mapZones.get_selected_id() == -1:
		mapZoneAsterisc.set("custom_colors/font_color", Color8(255,0,0,255))
		return 0
	else: 
		mapZoneAsterisc.set("custom_colors/font_color", Color8(43, 203, 25,255))
		return 1
	

	
	
		
		
func check_selected_image():
	var image = get_imageSelected()
	#var extension = image.split(".")
	var extension = image.get_extension()
	#if image == "NA" or len(extension) == 0 or extension[-1] != "png":
	if image == "NA" or extension == "" or extension != "png":
		imageAsterisc.set("custom_colors/font_color", Color8(255,0,0,255))
		return 0
		
	else: 
		imageAsterisc.set("custom_colors/font_color", Color8(43, 203, 25,255))
		return 1
		
func check_selected_file():
	var file = get_fileSelected()
	var extension = file.get_extension()
	if file == "NA" or extension == "" or extension != "txt":
		fileAsterisc.set("custom_colors/font_color", Color8(255,0,0,255))
		return 0
		
	else: 
		fileAsterisc.set("custom_colors/font_color", Color8(43, 203, 25,255))
		return 1
		
		

		


		
		
		
func show_result(cardTitle, cardDescription, imagePath, zone, cardScore, skill, skillTranslated):
	var root_node = get_node("/root")
	

	#var currentCard = root_node.get_child(0)
	#print("first child: ",currentCard.get_name())
	#currentCard.queue_free()
	
	var cardPreview = load("res://UI/AdminArea/NewCardPreview.tscn")
	var cardInstance = cardPreview.instance()
	


	cardInstance.set_up(cardTitle, cardDescription, imagePath, zone, cardScore, skill, skillTranslated)
	cardInstance.set_origin("")

	
	root_node.add_child(cardInstance)
	
	#root_node.move_child(cardInstance,0)
		
	

	

	
func read_content(fileName):
	var file = File.new()
	file.open(fileName, File.READ)
	var content = file.get_as_text()
	file.close()
	return content.split("|")
	
	

	
