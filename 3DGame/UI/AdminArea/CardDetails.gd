extends Control

onready var title = $GridContainer/Title_input
onready var explanation = $GridContainer/Explanation_input
onready var image = $GridContainer/Image_input
onready var score = $GridContainer/Score_input
onready var skills = $GridContainer/Skills_input

onready var cardType = $CardTitle

func submit():
	var file = File.new()
	var pathToFile = "res://Cards/" + cardType.text + "/" + title.text + ".txt"
	file.open(pathToFile, File.WRITE)
	file.store_string("TITULO| " + title.text + "|\n")
	file.store_string("INSTRUCTIONS| " + explanation.text + "|\n")
	file.store_string("IMAGE| " + image.text + "|\n")
	file.store_string("SCORE| " + score.text + "|\n")
	file.store_string("SKILLS| " + skills.text + "|\n")
	
	file.close()

		
	
	
