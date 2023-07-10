extends TextureButton

export(String, FILE) var nextCard



var data=[] setget save_data, get_data
var cardType = "" setget save_cardType, get_cardType
var cardTypeName = "" setget set_cardTypeName, get_cardTypeName
var cardId = 0 setget set_cardId, get_cardId

func _input(event):
	if event.is_action_pressed("RightArrow") and self.visible:
		emit_signal("button_down")
		emit_signal("pressed")


func showNextCard():
	var root_node = get_node("/root")

	var currentCard = root_node.get_child(0)
	currentCard.queue_free()
	
	var cardScene = load(nextCard)
	var cardInstance = cardScene.instance()
	var card_data = get_data()


	cardInstance.set_card_data(card_data)
	cardInstance.set_cardType(get_cardType())
	cardInstance.set_cardTypeName(get_cardTypeName())

	cardInstance.set_cardId(get_cardId())
	
	root_node.add_child(cardInstance)
	root_node.move_child(cardInstance,0)
	
	
func save_data(dataReceived):
	data = dataReceived
	
func get_data():
	return data
	
func save_cardType(type):
	cardType = type
	
func get_cardType():
	return cardType
	
func set_cardId(id):
	cardId = id
	
func get_cardId():
	return cardId
	
func set_cardTypeName(type):
	cardTypeName = type

func get_cardTypeName():
	return cardTypeName



