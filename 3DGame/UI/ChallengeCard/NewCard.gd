extends Spatial

onready var playerImage = $Control/BackgroundRect/VBoxContainer/Control/CardHeader/PlayerAvatar

var card_data = [] setget set_card_data, get_card_data

var cardType setget set_cardType, get_cardType
var origin = "" setget set_origin, get_origin

signal data_saved(card_data)
signal type_saved(type)
signal set_origin(origin)

func _ready():
	if get_origin() == "":
		var currentScene = get_node("/root/CardPreview")
		currentScene.queue_free()
	
		
	var currentPlayer = SavingManager.current_player
	playerImage.set_texture(CharactersManager.get_character_icon(SettingsManager.players[currentPlayer].character))
	
func set_card_data(dataReceived):
	card_data = dataReceived
	emit_signal("data_saved", card_data)

	
func get_card_data():
	return card_data
	
func set_cardType(t):
	emit_signal("type_saved", t)
	cardType = t
	print("quando guardo a info da primeria vez o tipo e ", cardType)

func get_cardType():
	return cardType

func go_back():
	print("going back")
	var root_node = get_node("/root")
	

	var currentCard = root_node.get_child(0)
	currentCard.queue_free()
	
	var cardScene = load("res://UI/ChallengeCard/CardPreview.tscn")
	var cardInstance = cardScene.instance()
	print("setting the origin on the card")
	cardInstance.set_origin("back")
	cardInstance.set_cardData(get_card_data())
	print("card type na newcard ", get_cardType())
	cardInstance.set_cardType(get_cardType())

	
	root_node.add_child(cardInstance)
	root_node.move_child(cardInstance,0)
	

func set_origin(orig):
	origin = orig
	print("setting the origin in new card to ", orig)
	emit_signal("set_origin", origin)
	
func get_origin():
	return origin

