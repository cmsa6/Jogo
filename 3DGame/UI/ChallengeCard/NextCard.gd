extends TextureButton

export(String, FILE) var nextCard


var data=[] setget save_data, get_data

func showNextCard():
	var root_node = get_node("/root")

	var currentCard = root_node.get_child(0)
	currentCard.queue_free()
	
	var cardScene = load(nextCard)
	var cardInstance = cardScene.instance()
	var card_data = get_data()
	print("Ainda no preview")
	cardInstance.set_card_data(card_data)
	#cardInstance.teste()
	root_node.add_child(cardInstance)
	root_node.move_child(cardInstance,0)
	
	
func save_data(dataReceived):
	data = dataReceived
	
func get_data():
	return data
	

