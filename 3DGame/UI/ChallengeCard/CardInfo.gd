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
	file.open("res://Cards/Cognitive Card/jogo do lenco.txt", File.READ)
	var content = file.get_as_text()
	file.close()
	
	var newcontent = content.split("|")
	

	title.text = newcontent[1]
	instructions.text = newcontent[3]
	score.text = newcontent[7]
	skills.text = "Skills: " + newcontent[9]	

		
