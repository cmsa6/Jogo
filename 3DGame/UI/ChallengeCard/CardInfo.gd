extends VBoxContainer

onready var title = $Title
onready var instructions = $HBoxContainer/Instructions
onready var image = $HBoxContainer/TextureRect
onready var audio = $MinigameSound

var card_info = [] setget save_card_info, get_card_info



func _ready():
	audio.play(0)
	
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

	title.text = card_info[1]
	instructions.text = card_info[3]
	#skills.text = "Skills: " + card_info[9]

	var imageName = card_info[1] 
	
	imageName = imageName.replace(" ","")
	
	for f in files:
		if imageName in f:
			#image.set_texture(image)
			
			var imagePath = "res://Cards/Fotos/" + imageName +".png"
			var imagePhoto = load(imagePath)
			image.texture = imagePhoto

	

		
func save_card_info(data):
	card_info = data

	
func get_card_info():
	return card_info
	
