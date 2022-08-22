extends Control

onready var cardDisplay = $ColorRect/VBoxContainer/ScrollContainer/cardDisplay
onready var translator  = $TranslationManager

var zone = "" setget set_zone, get_zone
var cardId = 0 setget set_cardId, get_cardId
#func _ready():
#	var dir = Directory.new()
#	var directoryPath = "res://Cards/Cognitive Card"
#	if dir.open(directoryPath) == OK:
#		dir.list_dir_begin()

func _ready():
	translator.translate(get_zone())
	display_cards(SettingsManager.language)
			
func display_cards(language):
	var dir = Directory.new()
	var mapZone = translate_zone(get_zone())
	var directoryPath = "res://Cards/" + language + "/" + mapZone
	if dir.open(directoryPath) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not file_name.begins_with("."):
				var pathToFile = directoryPath + "/" + file_name
				var file = File.new()
				file.open(pathToFile, File.READ)
				var content = file.get_as_text()
				file.close()
				
				generate_card(content, file_name)
			file_name = dir.get_next()

func set_zone(z):
	zone = z
	
func get_zone():
	return zone
	
func set_cardId(id):
	cardId = id
	
func get_cardId():
	return cardId
		
	
func translate_zone(zone):
	match zone:
		"Blue"  : return "HELP"
		"Green" : return "SERVICES"
		"Orange": return "COMMERCIAL"
		"Purple": return "LEISURE"


func generate_card(content, file_name):
	var newcontent = content.split("|")
	var cardScene = preload("res://UI/AdminArea/CardTemplate.tscn")
	var newCard = cardScene.instance()
	cardDisplay.add_child(newCard)
	populateCard(newCard, newcontent, file_name)
	
	
func populateCard(cardInstance, content, file_name):
	var title          = cardInstance.get_title_node()
	var description    = cardInstance.get_description_node()
	var image          = cardInstance.get_image_node()
	var score          = cardInstance.get_score_node()
	var skill          = cardInstance.get_skill_node()
	var cardColor      = cardInstance.get_cardColor_node()
	var cardBackground = cardInstance.get_cardBackground_node()
	
	
	var translatedZone = translate_zone(get_zone())
	cardInstance.set_zone(translatedZone)
	
	#var newCardId = get_cardId() + 1
	#set_cardId(newCardId)
	#cardInstance.set_id(newCardId)
	var name = file_name.split(".")[0]
	cardInstance.set_id(name)

	
	title.text = content[1]
	description.text = content[3].replace("ENTER", "\n")
	score.text = "+ " + content[7]
	
	
	#var imagePath = "res://Cards/" + SettingsManager.language + "/Photos/" + content[1] +  ".png"
	
	var imagePath = "res://Cards/" + SettingsManager.language + "/Photos/" + name +  ".png"
	
	#print("path da imagem: ", imagePath)
	#var img = load(imagePath)
	#image.texture = img
	
	
	var img = Image.new()
	img.load(imagePath)

	var tex = ImageTexture.new()
	tex.create_from_image(img)

	image.texture = tex
	
	
	var skillName = content[9].replace(" ","")
	var skillImagePath = "res://Cards/Skills/" + skillName + ".png"
	var skillImg = load(skillImagePath)
	skill.texture = skillImg
	
	change_card_colors(translatedZone, cardColor, cardBackground, title, score)
	
	
func change_card_colors(zone, cardColor, cardBackground, title, score):
	var backgroundColor
	var mainColor    
	var outlineColor 
	
	if zone == "COMMERCIAL":
		backgroundColor    = Color8(244, 202, 156, 200)
		mainColor    = Color8(223, 135, 31, 255)
		outlineColor = Color8(159, 86, 0, 255)
		
	elif zone == "SERVICES":
		backgroundColor    = Color8(180, 193, 149, 200)
		mainColor    = Color8(81, 132, 26, 255)
		outlineColor = Color8(56, 100, 7, 255)
		
	elif zone == "LEISURE":
		backgroundColor    = Color8(231, 189, 232, 200)
		mainColor    = Color8(186, 74, 169, 255)
		outlineColor = Color8(116, 19, 101, 255)
		
	elif zone == "HELP":		
		mainColor    = Color8(74, 139, 186, 255)
		outlineColor = Color8(15, 86, 177, 255)
		backgroundColor    = Color8(184, 206, 222, 200)

	
	cardColor.color =  mainColor
	cardBackground.color = backgroundColor
	
	#titleFont.set("custom_colors/font_color", outlineColor)
	#titleFont.set("custom_colors/font_outline_modulate", mainColor)
	
	title.set("custom_colors/font_color", mainColor)
	title.set("custom_colors/font_outline_modulate", outlineColor)
	
	score.set("custom_colors/font_color", mainColor)
	score.set("custom_colors/font_outline_modulate", outlineColor)
	
	
	

	
	


