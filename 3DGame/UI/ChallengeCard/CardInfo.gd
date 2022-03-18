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
	print("Cardinfo")
	print(card_info)
	title.text = card_info[1]
	instructions.text = card_info[3]
	#skills.text = "Skills: " + card_info[9]
	print("vendo imagens")
	print(files)
	var imageName = card_info[1] 
	
	imageName = imageName.replace(" ","")
	
	
	print(imageName)
	for f in files:
		if imageName in f:
			print("entrei")
			#image.set_texture(image)
			
			var imagePath = "res://Cards/Fotos/" + imageName +".png"
			var imagePhoto = load(imagePath)
			image.texture = imagePhoto
			print("i setted the picture")
	

		
func save_card_info(data):
	print("no save_card_info")
	card_info = data
	print(card_info)
	
func get_card_info():
	return card_info
	
