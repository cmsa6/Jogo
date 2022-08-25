extends Control


onready var title             = $VBoxContainer2/VBoxContainer/RewardTitle2
onready var description       = $VBoxContainer2/VBoxContainer/CardColor/CardInfo/Instructions
onready var image             = $VBoxContainer2/VBoxContainer/CardColor/CardInfo/VBoxContainer/ChallengeImage
onready var imageZoomedIn     = $VBoxContainer2/VBoxContainer/CardColor/CardInfo/ZoomedInImage
onready var score             = $VBoxContainer2/VBoxContainer/skillBackground/SkillInfo/NumberPoints
onready var skill             = $VBoxContainer2/VBoxContainer/skillBackground/SkillInfo/Skill
onready var cardColor         = $VBoxContainer2/VBoxContainer/CardColor
onready var cardBackground    = $ColorRect
onready var confirmationPopup = $ConfirmationDialog
onready var zoomInButton      = $VBoxContainer2/VBoxContainer/CardColor/CardInfo/VBoxContainer/zoomButtonIn/ZoomInButton
onready var imageContainer    = $VBoxContainer2/VBoxContainer/CardColor/CardInfo/VBoxContainer
onready var zoomOut           = $VBoxContainer2/VBoxContainer/CardColor/CardInfo/zoomButton
onready var zoomOutButton     = $VBoxContainer2/VBoxContainer/CardColor/CardInfo/zoomButton/ZoomOutButton
onready var skillBackground   = $VBoxContainer2/VBoxContainer/skillBackground

var zone = "" setget set_zone, get_zone
var id = -1 setget set_id, get_id
var nameOfFile = "" setget set_nameOfFile, get_nameOfFile


func get_title_node():
	return title
	
func get_description_node():
	return description
	
func get_image_node():
	return image
	
func get_imageZoomedIn_node():
	return imageZoomedIn
	
func get_score_node():
	return score
	
func get_skill_node():
	return skill
	
func get_cardColor_node():
	return cardColor
	
func get_cardBackground_node():
	return cardBackground
	
func get_skillBackground_node():
	return skillBackground
	
func set_zone(z):
	zone = z
	
func get_zone():
	return zone
	
	
func set_id(i):
	id = i
	
func get_id():
	return id
	
func set_nameOfFile(n):
	nameOfFile = n
	
func get_nameOfFile():
	return nameOfFile

func check_erase_challenge():
	var fileName = get_file_name()[1]
	print(fileName)
	confirmationPopup.dialog_text = confirmationPopup.dialog_text + "\"" + fileName + "\"?"
	print(confirmationPopup.dialog_text)
	confirmationPopup.popup()
	
	
func erase_challenge():
	var dir = Directory.new()
	#var challengePath = "res://Cards/" + SettingsManager.language + "/" + get_zone() + "/" + title.text + ".tres"
	var challengePath = "user://Cards/" + SettingsManager.language + "/" + get_zone() + "/" + str(get_nameOfFile()) + ".tres"
	print(challengePath)
	#ChallengesManager.remove_card(get_id())
		
	dir.remove(challengePath)
	erase_image()
	reset_scroll()
	get_parent().remove_child(self)
	
	
	
func erase_image():
	var dir = Directory.new()
	var imgPath = "user://Cards/" + SettingsManager.language  + "/photos/" + get_nameOfFile() + ".png"
	dir.remove(imgPath)
	
func reset_scroll():
	var scrollContainer = get_parent().get_parent()
	scrollContainer.set_h_scroll(0)

func edit_card():
	var root_node = get_node("/root")
	
	var cardPreview = load("res://UI/AdminArea/CardDetails.tscn")
	var cardInstance = cardPreview.instance()
	cardInstance.set_origin("edit")
	print(get_nameOfFile())
	var filePath = "user://Cards/" + SettingsManager.language + "/" + get_zone() + "/" + str(get_nameOfFile()) + ".tres"
	cardInstance.set_fileToOpen(filePath)
	print("editing file ", filePath)
	root_node.add_child(cardInstance)
	
func get_file_name():
	var filePath = "user://Cards/" + SettingsManager.language + "/" + get_zone() + "/" + str(get_nameOfFile()) + ".tres"
	var file = File.new()
	file.open(filePath, File.READ)
	var content = file.get_as_text()
	file.close()
	return content.split("|")
	
	
func enable_zoom():
	if not imageZoomedIn.visible:
		imageZoomedIn.visible = true
		description.visible = false
		#image.visible = false
		zoomInButton.visible = false
		imageContainer.visible = false
		
		zoomOut.visible = true
		zoomOutButton.visible = true
	else:
		imageZoomedIn.visible = false
		description.visible = true
		#image.visible = true
		zoomInButton.visible = true
		imageContainer.visible = true
		zoomOut.visible = false
		zoomOutButton.visible = false
