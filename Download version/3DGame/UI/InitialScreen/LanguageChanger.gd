extends Control

onready var flag = $VBoxContainer/HBoxContainer/VBoxContainer/Flag
onready var flagSubtitle = $VBoxContainer/HBoxContainer/VBoxContainer/Label


var languagePos = 1 setget set_languagePos, get_languagePos
var languages = {1:"en", 2:"es", 3:"el", 4:"it", 5:"pt"} 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


func set_languagePos(lang):
	languagePos = lang
	
func get_languagePos():
	return languagePos
	
func increment_languagePos():
	var newValue = get_languagePos() + 1
	if newValue >= 6:
		newValue = 1
	set_languagePos(newValue)
	change_language()
	
func decrement_languagePos():
	var newValue = get_languagePos() - 1
	if newValue <= 0:
		newValue = 5
	set_languagePos(newValue)
	change_language()
	
	
func change_language():
	var language = languages[get_languagePos()]
	var imagePath = "res://Languages/" + language + ".png"
	var image = load(imagePath)
	flag.set_texture(image)
	change_subtitle(language)
	
func change_subtitle(language):
	match language:
		"en": flagSubtitle.text = "English"
		"es": flagSubtitle.text = "Español"
		"el": flagSubtitle.text = "Ελληνικά"
		"it": flagSubtitle.text = "Italiano"
		"pt": flagSubtitle.text = "Português"
		 
	
	
	
	
	

