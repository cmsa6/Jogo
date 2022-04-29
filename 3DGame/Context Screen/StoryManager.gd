extends GridContainer

onready var  nextButton1 = $Part1/NextStory1

onready var story2 = $Part2/Story2
onready var  nextButton2 = $Part2/NextStory2

onready var story3 = $Part3/Story3
onready var  nextButton3 = $Part3/NextStory3

onready var story4 = $Part4/Story4

export(NodePath) var finalButton

signal show_map()


	

func show_next(currentID):
	if currentID == "1":
		nextButton1.visible = false
		story2.visible = true
		nextButton2.visible = true
	elif currentID == "2":
		nextButton2.visible = false
		story3.visible = true
		nextButton3.visible = true
	elif currentID == "3":
		nextButton3.visible = false
		story4.visible = true
		get_node(finalButton).visible = true
	else:
		emit_signal("show_map")
