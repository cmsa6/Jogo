extends Spatial

export (String) var cardName

onready var title = $Control/BackgroundRect/VBoxContainer/RewardTitle2
onready var image = $Control/BackgroundRect/VBoxContainer/CardColor/CardInfo/VBoxContainer/TextureRect
onready var instructions = $Control/BackgroundRect/VBoxContainer/CardColor/CardInfo/Instructions

func _ready():

	var files = []
	var photoDir = "res://Cards/en/Photos/"
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
	
	var fileName = "res://Cards/en/COMMERCIAL/" + cardName + ".tres"
		
	var file = File.new()
	file.open(fileName, File.READ)
	var content = file.get_as_text()
	file.close()
	
	var newcontent = content.split("|")
	

	title.text = newcontent[1]
	var challengeText = newcontent[3].replace("ENTER", "\n")
	instructions.text = challengeText
	

	var imageName = newcontent[1] 
	
	
	
	
	for f in files:
		if imageName in f:			
			var imagePath = "res://Cards/en/Photos/" + imageName +".png"
			var imagePhoto = load(imagePath)
			image.texture = imagePhoto
			break

				
		
	
	