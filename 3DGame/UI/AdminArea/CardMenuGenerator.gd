extends HBoxContainer


func _ready():
	#var file = File.new()
	#file.open("res://Cards/Cognitive Card/jogo do lenco.txt", File.READ)
	#var content = file.get_as_text()
	#file.close()
	
	var dir = Directory.new()
	var directoryPath = "res://Cards/Cognitive Card"
	if dir.open(directoryPath) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			elif "jogo" in file_name:
				var pathToFile = directoryPath + "/" + file_name

				var file = File.new()
				file.open(pathToFile, File.READ)
				var content = file.get_as_text()
				file.close()
				
				makeNewCard(content)

				
			file_name = dir.get_next()


func makeNewCard(content):
	var newcontent = content.split("|")
		
	
	var cardScene = preload("res://UI/ChallengeCard/ColorRect.tscn")
	var newCard = cardScene.instance()
	add_child(newCard)
	populateCard(newCard, newcontent)
	
func populateCard(newCard, content):
	var cardInfo = newCard.get_node("CardInfo")
	var scoreInfo = cardInfo.get_node("Score")
	var titleInfo = cardInfo.get_node("Title")
	var instructionsInfo = cardInfo.get_node("Instructions")
	var skillsInfo = cardInfo.get_node("Skills")
	
	scoreInfo.text = content[7]
	titleInfo.text = content[1]
	instructionsInfo.text = content[3]
	skillsInfo.text = content[9]
	

	
