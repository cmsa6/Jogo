extends VBoxContainer

#onready var title = $Title
onready var instructions = $HBoxContainer/Instructions
onready var image = $HBoxContainer/TextureRect
onready var zoomImage = $HBoxContainer/ZoomedInImage
onready var audio = $MinigameSound
onready var zoomOut = $HBoxContainer/ZoomOutButton
onready var zoomIn = $HBoxContainer/ZoomInButton

export(NodePath) var cardColor
export(NodePath) var backColor
export(NodePath) var title

var card_info = [] setget save_card_info, get_card_info
var cardType = "" setget save_cardType



func _ready():
	set_card_color(get_cardType())
	#audio.play(0)
	
	#var randomFile = select_random_file()
	
	#var fileName = "res://Cards/Cognitive Card/" + randomFile
	#print("it selected the file ", fileName)
	#var file = File.new()
	#file.open(fileName, File.READ)
	#var content = file.get_as_text()
	#file.close()
	
	#var newcontent = content.split("|")
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
			#image.set_texture(image)
			
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
	
#func set_card_color(type):
#	print("setting color for card of type: ", type)
#	var card = get_node(cardColor)
#	var background = get_node(backColor)
#	var font = title.get("custom_fonts/font")
#	var instructionsFont = instructions.get("custom_fonts/font")
#
#	if type == "COMMERCIAL":
#		card.color = Color8(223, 135, 31, 255)
#		background.color = Color8(244, 202, 156, 200)
#		font.outline_color = Color8(223, 135, 31, 255)
#		instructionsFont.outline_color = Color8(223, 135, 31, 255)
#
#	elif type == "SERVICES":
#		card.color =  Color8(116, 178, 47, 255)
#		background.color = Color8(218, 231, 170, 200)
#		font.outline_color = Color8(116, 178, 47, 255)
#		instructionsFont.outline_color = Color8(116, 178, 47, 255)
#
#	elif type == "LEISURE":
#		card.color = Color8(186, 74, 169, 255)
#		background.color = Color8(231, 189, 232, 200)
#		font.outline_color = Color8(186, 74, 169, 255)
#		instructionsFont.outline_color = Color8(186, 74, 169, 255)
#
#	elif type == "HELP":
#		card.color =  Color8(74, 139, 186, 255)
#		background.color = Color8(220, 223, 246, 200)
#		font.outline_color = Color8(74, 139, 186, 255)
#		instructionsFont.outline_color = Color8(74, 139, 186, 255)

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
	print("zoomin")
	print(zoomImage.visible)
	if not zoomImage.visible:
		zoomImage.visible = true
		image.visible = false
		instructions.visible = false
		zoomIn.visible = false
		zoomOut.visible = true
	else:
		zoomImage.visible = false
		image.visible = true
		instructions.visible = true
		zoomIn.visible = true
		zoomOut.visible = false


func _on_Button_button_up():
	print("something")
