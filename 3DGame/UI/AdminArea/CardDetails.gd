extends Control

onready var title       = $GridContainer/Title_input
onready var explanation = $GridContainer/Description_input
onready var image       = $GridContainer/Image_input
onready var score       = $GridContainer/Score_input
onready var skills      = $GridContainer/Skills_input


onready var availableSkills = $GridContainer/OptionButton
onready var mapZones        = $GridContainer/MapZones

onready var imagePath       = $GridContainer/HBoxContainer2/ImagePath


onready var mapZonesAsteric = $GridContainer/MapZonesAsteric
onready var titleAsteric    = $GridContainer/TitleAsterisc
onready var descriptionAsteric    = $GridContainer/DescriptionAsterisc
onready var imageAsteric    = $GridContainer/ImageAsterisc
onready var scoreAsteric    = $GridContainer/ScoreAsterisc
onready var skillAsteric    = $GridContainer/SkillAsterisc

var imageSelected = "NA" setget set_imageSelected, get_imageSelected 



func _ready():
	availableSkills.add_item("Select skill encouraged by the challenge")
	availableSkills.add_item("Interpersonal Relationship")
	availableSkills.add_item("Social Inclusion")
	availableSkills.add_item("Rights")
	availableSkills.add_item("Personal Development")
	availableSkills.add_item("Self-Determination")
	availableSkills.add_item("Physical Wellbeing")
	availableSkills.add_item("Material Wellbeing")
	availableSkills.add_item("Emotional Wellbeing")
	availableSkills.add_item("Calculus and Problem Solving")
	availableSkills.add_item("Language")
	availableSkills.add_item("Memory and Attention to Detail")
	availableSkills.add_item("Spatial Orientation")
	availableSkills.add_item("Social and Emotional Wellbeing")
	
	mapZones.add_item("Select map zone")
	mapZones.add_item("Blue Zone")
	mapZones.add_item("Green Zone")
	mapZones.add_item("Orange Zone")
	mapZones.add_item("Purple Zone")
		

func submit():
	if check_fields():	
		var imagePath = save_image()
		
		var cardTitle = title.text
		var cardDescription = explanation.text
		var cardScore = score.text
		
		var file = File.new()

		var zone  = check_mapZone()
		var skill = check_skill() 

		var pathToFile = "res://Cards/" + SettingsManager.language + "/" + zone + "/" + cardTitle + ".tres"
		file.open(pathToFile, File.WRITE)
		file.store_string("TITULO|" + cardTitle + "|\n")
		file.store_string("INSTRUCTIONS| " + cardDescription + "|\n")
		file.store_string("IMAGE| |\n")
		file.store_string("SCORE| " + cardScore + "|\n")
		file.store_string("SKILLS| " + skill + "\n")

	#file.close()

		print("sending this image:", imagePath)
		show_result(cardTitle, cardDescription, imagePath, zone, cardScore, skill)

		
	
func save_image():
	var image = get_imageSelected()
	if image != "NA":
		var imageExtension = image.split(".")[-1]
		var photosFolder = "res://Cards/" + SettingsManager.language + "/Photos/" + title.text + "." + imageExtension
		
		#var photosFolder = "res://Cards/" + SettingsManager.language + "/Photos/" + imageName[-1]
		var dir = Directory.new()
		print("photosfolder: ", photosFolder)
		dir.copy(image, photosFolder)
		

		
		return photosFolder


func _on_FileDialog_file_selected(path):
	print(path)
	set_imageSelected(path)
	var imageName = path.split("\/")
	imagePath.text = imageName[-1]
	
	
func set_imageSelected(imagePath):
	imageSelected = imagePath
	
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
		
		
	
func check_skill():
	var id = availableSkills.get_selected_id()
	
	match id:
		0: return "NA"
		1: return "Interpersonal Relationship"
		2: return "Social Inclusion"
		3: return "Rights"
		4: return "Personal Development"
		5: return "Self-Determination"
		6: return "Physical Wellbeing"
		7: return "Material Wellbeing"
		8: return "Emotional Wellbeing"
		9: return "Calculus and Problem Solving"
		10: return "Language"
		11: return "Memory and Attention to Detail"
		12: return "Spatial Orientation"
		13: return "Social and Emotional Wellbeing"
	
#	if   id == 0: return "Interpersonal Relationship"
#	elif id == 1: return "Social Inclusion"
#	elif id == 2: return "Rights"
#	elif id == 3: return "Personal Development"
#	elif id == 6: return "Self-Determination"
#	elif id == 7: return "Physical Wellbeing"
#	elif id == 8: return "Material Wellbeing"
#	elif id == 6: return "Emotional Wellbeing"
#	elif id == 7: return "Calculus and Problem Solving"
#	elif id == 8: return "Language"
#	elif id == 6: return "Memory and Attention to Detail"
#	elif id == 7: return "Spatial Orientation"
#	elif id == 8: return "Social and Emotional Wellbeing"


func check_fields():
	var isMapZoneSelected     = check_selected_mapZone()
	var isTitleSelected       = check_selected_title()
	var isDescriptionSelected = check_selected_description()
	var isImageSelected       = check_selected_image()
	var isScoreSelected       = check_selected_score()
	var isSkillSelected       = check_selected_skill()
	
	return isMapZoneSelected*isTitleSelected*isDescriptionSelected*isImageSelected*isScoreSelected*isSkillSelected
	
	
	
	
	
func check_selected_mapZone():
	if mapZones.get_selected_id() == 0 or mapZones.get_selected_id() == -1:
		mapZonesAsteric.set("custom_colors/font_color", Color8(255,0,0,255))
		return 0
	else: 
		mapZonesAsteric.set("custom_colors/font_color", Color8(43, 203, 25,255))
		return 1
	
func check_selected_title():
	if title.text.length() == 0:
		titleAsteric.set("custom_colors/font_color", Color8(255,0,0,255))
		return 0
		
	else: 
		titleAsteric.set("custom_colors/font_color", Color8(43, 203, 25,255))
		return 1
	
	
func check_selected_description():
	if explanation.text.length() == 0:
		descriptionAsteric.set("custom_colors/font_color", Color8(255,0,0,255))
		return 0
		
	else: 
		descriptionAsteric.set("custom_colors/font_color", Color8(43, 203, 25,255))
		return 1
		
		
func check_selected_image():
	var image = get_imageSelected()
	var extension = image.split(".")
	print("image: ",image)
	if image == "NA" or len(extension) == 0 or extension[-1] != "png":
		imageAsteric.set("custom_colors/font_color", Color8(255,0,0,255))
		return 0
		
	else: 
		imageAsteric.set("custom_colors/font_color", Color8(43, 203, 25,255))
		return 1
		
		
func check_selected_score():
	if score.text.length() == 0:
		scoreAsteric.set("custom_colors/font_color", Color8(255,0,0,255))
		return 0
		
	else: 
		scoreAsteric.set("custom_colors/font_color", Color8(43, 203, 25,255))
		return 1
		

func check_selected_skill():
	print("availableskills: ", availableSkills.get_selected_id())
	if availableSkills.get_selected_id() == 0 or availableSkills.get_selected_id() == -1:
		skillAsteric.set("custom_colors/font_color", Color8(255,0,0,255))
		return 0
	
	else:
		skillAsteric.set("custom_colors/font_color", Color8(43, 203, 25,255))
		return 1
		
		
		
func show_result(cardTitle, cardDescription, imagePath, zone, cardScore, skill):
	var root_node = get_node("/root")
	

	#var currentCard = root_node.get_child(0)
	#print("first child: ",currentCard.get_name())
	#currentCard.queue_free()
	
	var cardPreview = load("res://UI/AdminArea/NewCardPreview.tscn")
	var cardInstance = cardPreview.instance()
	


	cardInstance.set_up(cardTitle, cardDescription, imagePath, zone, cardScore, skill)


	
	root_node.add_child(cardInstance)
	print("hello")
	#root_node.move_child(cardInstance,0)
	print("hello2")
	
	
	
	
	



		


	
	
	
