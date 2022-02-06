extends Spatial



var card_data = [] setget set_card_data, get_card_data

signal data_saved(card_data)

func _ready():
	var current_Scene = get_node("/root/CardPreview")
	current_Scene.queue_free()
	
func set_card_data(dataReceived):
	card_data = dataReceived
	var cardInfo = $Control/Card/CardInfo
	cardInfo.save_card_info(card_data)
	emit_signal("data_saved", card_data)

	
func get_card_data():
	return card_data
