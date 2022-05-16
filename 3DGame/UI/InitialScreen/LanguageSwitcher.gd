extends TextureButton

onready var flagImage = $Flag

var languagePos = 1 setget set_languagePos, get_languagePos
var language = "en" setget set_language, get_language

func _input(event):
	if event.is_action_pressed("Tab"):
		emit_signal("button_down")
		change_language()


func change_language():
	var position = get_languagePos()
	
	if position == 0:
		set_language("en")
		
	elif position == 1:
		set_language("es")
	
	elif position == 2:
		set_language("el")
		
	elif position == 3:
		set_language("it")
		
	elif position == 4:
		set_language("pt")
	
	var imagePath = "res://Languages/" + get_language() + ".png"
	var image = load(imagePath)
	flagImage.set_texture(image)
	
	
	set_languagePos(1)


func set_languagePos(val):
	languagePos += val
	
	if languagePos == 5:
		languagePos = 0
	
func get_languagePos():
	return languagePos
	
	
func set_language(lang):
	language = lang
	
func get_language():
	return language
	
	
func register_language():
	SettingsManager.language = get_language()
	
	



