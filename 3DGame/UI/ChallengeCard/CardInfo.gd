extends HBoxContainer

#onready var title = $Title
onready var instructions = $Instructions
onready var image = $VBoxContainer/TextureRect
onready var zoomImage = $ZoomedInImage
onready var audio = $MinigameSound
onready var zoomOut = $ZoomOutButton
onready var zoomIn = $VBoxContainer/ZoomInButton
onready var imageContainer = $VBoxContainer

export(NodePath) var cardColor
export(NodePath) var backColor
export(NodePath) var title

var card_info = [] setget save_card_info, get_card_info
var cardType = "" setget save_cardType
var origin = "" setget set_origin, get_origin



func _ready():
	if get_origin() == "":
		set_card_color(get_cardType())

		var files = []
		var dir = Directory.new()
		dir.open("res://Cards/Fotos/")
		dir.list_dir_begin()
		
		while true:
			var file = dir.get_next()
			if file == "":
				break
			elif not file.begins_with("."):
				files.append(file)

		dir.list_dir_end()
		

		card_info = get_card_info()

		get_node(title).text = card_info[1]
		var challengeText = card_info[3].replace("ENTER", "\n")
		instructions.text = challengeText
		#skills.text = "Skills: " + card_info[9]

		var imageName = card_info[1] 
		
		imageName = imageName.replace(" ","")
		
		for f in files:
			if imageName in f:			
				var imagePath = "res://Cards/Fotos/" + imageName +".png"
				var imagePhoto = load(imagePath)
				image.texture = imagePhoto
				zoomImage.texture = imagePhoto
	
	else:
		set_card_color(get_cardType())

		var cardData = get_card_info()

		get_node(title).text = cardData[1]
		var challengeText = cardData[3].replace("ENTER", "\n")
		instructions.text = challengeText
		#skills.text = "Skills: " + card_info[9]

		var imageName = cardData[1] 
		
		imageName = imageName.replace(" ","")
		
		
		var imagePath = "res://Cards/Fotos/" + imageName +".png"
		var imagePhoto = load(imagePath)
		image.texture = imagePhoto
		zoomImage.texture = imagePhoto

	

		
func save_card_info(data):
	card_info = data

	
func get_card_info():
	return card_info
	

func save_cardType(type):
	cardType = type
	print("saving card type to: ", type)


func get_cardType():
	return cardType
	



func set_card_color(colors):
	var card = get_node(cardColor)
	var background = get_node(backColor)
	var titleFont = get_node(title)
	

	var mainColor       = colors[0]
	var backgroundColor = colors[1]
	var outlineColor    = colors[2]
	
	card.color =  mainColor
	background.color = backgroundColor
	
	titleFont.set("custom_colors/font_color", outlineColor)
	titleFont.set("custom_colors/font_outline_modulate", mainColor)
	
	#titleFont.set("custom_colors/font_color", mainColor)
	instructions.set("custom_colors/font_outline_modulate", mainColor)
	
func enable_zoom():

	if not zoomImage.visible:
		zoomImage.visible = true
		instructions.visible = false
		#image.visible = false
		#zoomIn.visible = false
		imageContainer.visible = false
		zoomOut.visible = true
	else:
		zoomImage.visible = false
		instructions.visible = true
		#image.visible = true
		#zoomIn.visible = true
		imageContainer.visible = true
		zoomOut.visible = false


func set_origin(orig):
	origin = orig
	
func get_origin():
	return origin
