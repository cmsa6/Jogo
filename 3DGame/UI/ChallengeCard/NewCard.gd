extends Spatial

onready var playerImage = $Control/GridContainer/Avatar	

var card_data = [] setget set_card_data, get_card_data


signal data_saved(card_data)

func _ready():
	var currentScene = get_node("/root/CardPreview")
	currentScene.queue_free()
	
	var currentPlayer = SavingManager.current_player
	playerImage.set_texture(CharactersManager.get_character_icon(SettingsManager.players[currentPlayer].character))
	
func set_card_data(dataReceived):
	card_data = dataReceived
	emit_signal("data_saved", card_data)

	
func get_card_data():
	return card_data
