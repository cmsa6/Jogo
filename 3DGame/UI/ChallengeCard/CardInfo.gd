extends VBoxContainer

onready var title = $Title
onready var instructions = $Instructions
onready var image = $Image
onready var score = $Score
onready var skills = $Skills
onready var audio = $MinigameSound

func _ready():
	audio.play()
	var file = File.new()
	file.open("res://Cards/Cognitive Card/Jogo da Memoria.tres", File.READ)
	var content = file.get_as_text()
	file.close()
	
	var newcontent = content.split("|")
	

	
	title.text = newcontent[1]
	instructions.text = newcontent[3]
	skills.text = "Skills: " + newcontent[9]
	
	var reward = newcontent[10]	

		
