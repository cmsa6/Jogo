extends Control


onready var title  = $BackgroundRect/VBoxContainer/RewardTitle2
onready var description = $BackgroundRect/VBoxContainer/CardColor/CardInfo/Instructions
onready var image = $BackgroundRect/VBoxContainer/CardColor/CardInfo/VBoxContainer/ChallengeImage
onready var zoomedImage = $BackgroundRect/VBoxContainer/CardColor/CardInfo/ZoomedInImage
onready var background = $BackgroundRect
onready var card = $BackgroundRect/VBoxContainer/CardColor
onready var score = $BackgroundRect/VBoxContainer/SkillInfo/NumberPoints
onready var skillImage = $BackgroundRect/VBoxContainer/SkillInfo/Skill
onready var skillName =$BackgroundRect/VBoxContainer/SkillInfo/SkillName
onready var zoomInButton = $BackgroundRect/VBoxContainer/CardColor/CardInfo/VBoxContainer/zoomButtonIn/ZoomInButton
onready var zoomOutButton = $BackgroundRect/VBoxContainer/CardColor/CardInfo/zoomButton/ZoomOutButton
onready var zoomOut = $BackgroundRect/VBoxContainer/CardColor/CardInfo/zoomButton
onready var imageContainer = $BackgroundRect/VBoxContainer/CardColor/CardInfo/VBoxContainer

var titleReceived setget set_titleReceived, get_titleReceived
var descriptionReceived setget set_descriptionReceived, get_descriptionReceived
var imageReceived setget set_imageReceived, get_imageReceived
var zoneReceived setget set_zoneReceived, get_zoneReceived
var scoreReceived setget set_scoreReceived, get_scoreReceived
var skillReceived setget set_skillReceived, get_skillReceived



func set_up(newTitle, newDescription, imagePath, zone, score, skill):
	print("setting up")
	set_titleReceived(newTitle)
	set_descriptionReceived(newDescription)
	set_imageReceived(imagePath)
	set_zoneReceived(zone)
	set_scoreReceived(score)
	set_skillReceived(skill)
	
	
func _ready():
	set_title(get_titleReceived())
	set_description(get_descriptionReceived())
	set_image(get_imageReceived())
	set_colors(get_zoneReceived())
	set_score(get_scoreReceived())
	set_skill(get_skillReceived())
	
func set_title(newTitle):
	title.text = newTitle
	
func set_description(newDescription):
	description.text = newDescription
	
func set_score(newScore):
	score.text = "+" + newScore
	
func set_skill(newSkill):
	skillName.text = newSkill
	var skill = newSkill.replace(" ","")
	var skillPath = "res://Cards/Skills/" + skill + ".png"
	var skillPhoto = load(skillPath)
	skillImage.texture = skillPhoto
	
func set_image(imgPath):
#	var directory = Directory.new();
#	print(directory.file_exists(imgPath[0]))
#	print(directory.file_exists(imgPath[1]))
#	print(imgPath)
#	var path = imgPath[0]
#	var newImg = load(path)
#	image.set_texture(newImg)
#
#	var pathTeste = imgPath[1]
#	var imgTest = load(pathTeste)
#	imageTeste.texture=imgTest

	var imageTest = Image.new()
	imageTest.load(imgPath)

	var tex = ImageTexture.new()
	tex.create_from_image(imageTest)

	image.texture = tex
	zoomedImage.texture = tex


func set_titleReceived(t):
	titleReceived = t
	
func get_titleReceived():
	return titleReceived
	
	
	
func set_descriptionReceived(d):
	descriptionReceived = d
	
func get_descriptionReceived():
	return descriptionReceived
	
	
func set_imageReceived(i):
	imageReceived = i
	
func get_imageReceived():
	return imageReceived
	
func set_zoneReceived(z):
	zoneReceived = z
	
func get_zoneReceived():
	return zoneReceived
	
	
func set_scoreReceived(s):
	scoreReceived = s
	
func get_scoreReceived():
	return scoreReceived
	
	
func set_skillReceived(s):
	skillReceived = s
	
func get_skillReceived():
	return skillReceived
	
	
	
func set_colors(mapZone):
	var backgroundColor
	var mainColor    
	var outlineColor 
	
	if mapZone == "COMMERCIAL":
		backgroundColor    = Color8(244, 202, 156, 200)
		mainColor    = Color8(223, 135, 31, 255)
		outlineColor = Color8(159, 86, 0, 255)
		
	elif mapZone == "SERVICES":
		backgroundColor    = Color8(180, 193, 149, 200)
		mainColor    = Color8(81, 132, 26, 255)
		outlineColor = Color8(56, 100, 7, 255)
		
	elif mapZone == "LEISURE":
		backgroundColor    = Color8(231, 189, 232, 200)
		mainColor    = Color8(186, 74, 169, 255)
		outlineColor = Color8(116, 19, 101, 255)
		
	elif mapZone == "HELP":		
		mainColor    = Color8(74, 139, 186, 255)
		outlineColor = Color8(15, 86, 177, 255)
		backgroundColor    = Color8(184, 206, 222, 200)

	
	card.color =  mainColor
	background.color = backgroundColor
	
	#titleFont.set("custom_colors/font_color", outlineColor)
	#titleFont.set("custom_colors/font_outline_modulate", mainColor)
	
	title.set("custom_colors/font_color", mainColor)
	title.set("custom_colors/font_outline_modulate", outlineColor)
	
	score.set("custom_colors/font_color", mainColor)
	score.set("custom_colors/font_outline_modulate", outlineColor)
	
	skillName.set("custom_colors/font_color", mainColor)
	skillName.set("custom_colors/font_outline_modulate", outlineColor)
	

func enable_zoom():
	if not zoomedImage.visible:
		zoomedImage.visible = true
		description.visible = false
		#image.visible = false
		zoomInButton.visible = false
		imageContainer.visible = false
		
		zoomOut.visible = true
		zoomOutButton.visible = true
	else:
		zoomedImage.visible = false
		description.visible = true
		#image.visible = true
		zoomInButton.visible = true
		imageContainer.visible = true
		zoomOut.visible = false
		zoomOutButton.visible = false
		
		
func go_back_to_menu():
	var root_node = get_node("/root")
	var children = root_node.get_children()
	for child in children:
		print(child.get_name())
	get_tree().change_scene("res://UI/AdminArea/CardManager.tscn")