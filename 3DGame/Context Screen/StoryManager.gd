extends GridContainer



onready var story1Text= $Part1/Story1/HBoxContainer/VBoxContainer/WelcomeText
onready var  nextButton1 = $Part1/ButtonLayer/NextStory1

onready var story2 = $Part2/Story2
onready var story2Text = $Part2/Story2/HBoxContainer/VBoxContainer/Label
onready var  nextButton2 = $Part2/ButtonLayer/NextStory2

onready var story3 = $Part3/Story3
onready var story3Text = $Part3/Story3/HBoxContainer/VBoxContainer/Label
onready var  nextButton3 = $Part3/ButtonLayer/NextStory3

onready var story4 = $Part4/Story4
onready var story4Text = $Part4/Story4/HBoxContainer/VBoxContainer/Label

export(NodePath) var finalButton

signal show_map()
signal talk(text)
signal stop()


func _ready():
	if SettingsManager.get_ttsEnabled():
		emit_signal("stop")		
		emit_signal("talk", story1Text.text)


	

func show_next(currentID):
	if story2.visible == false:
		if SettingsManager.get_ttsEnabled():
			emit_signal("stop")
			emit_signal("talk", story2Text.text)
		
		story2.visible = true
	elif story3.visible == false:
		if SettingsManager.get_ttsEnabled():
			emit_signal("stop")
			emit_signal("talk", story3Text.text)
	
		story3.visible = true
	elif story4.visible == false:
		if SettingsManager.get_ttsEnabled():
			emit_signal("stop")
			print("fiz o stop")
			emit_signal("talk", story4Text.text)
		
		story4.visible = true
	else:
		if "Second" in get_parent().get_name():
			MusicAudioManager.fade_out_music()
		emit_signal("show_map")
	
#	print(currentID)
#	if currentID == "1":
#		nextButton1.visible = false
#		story2.visible = true
#		nextButton2.visible = true
#	elif currentID == "2":
#		nextButton2.visible = false
#		story3.visible = true
#		nextButton3.visible = true
#	elif currentID == "3":
#		nextButton3.visible = false
#		story4.visible = true
#		get_node(finalButton).visible = true
#	else:
#		emit_signal("show_map")
