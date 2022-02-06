extends VBoxContainer

onready var title = $Title
onready var instructions = $Instructions
onready var image = $Image
onready var score = $Score
onready var skills = $Skills
onready var audio = $MinigameSound

var card_info = [] setget save_card_info, get_card_info



func _ready():
	audio.play()
	
	#var randomFile = select_random_file()
	
	#var fileName = "res://Cards/Cognitive Card/" + randomFile
	#print("it selected the file ", fileName)
	#var file = File.new()
	#file.open(fileName, File.READ)
	#var content = file.get_as_text()
	#file.close()
	
	#var newcontent = content.split("|")
	

	card_info = get_card_info()
	title.text = card_info[1]
	instructions.text = card_info[3]
	skills.text = "Skills: " + card_info[9]
	

		
func save_card_info(data):
	print("dentro do card info da newcard")
	print(data)
	card_info = data
	
func get_card_info():
	return card_info
	
