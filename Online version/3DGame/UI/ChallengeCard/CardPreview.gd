extends Spatial

onready var audio = $AudioStreamPlayer
onready var rewardDetails = $Control/Card2/VBoxContainer/LeftSide/RewardDetails

signal type_setted(type)
signal set_origin(origin)
signal set_cardData(data)
signal set_cardType(type)
signal set_cardId(id)
signal set_rewardSkip(reward)
signal set_cardTypeName(name)

var origin     = "" setget set_origin, get_origin



func _ready():
	if get_origin() == "":
		audio.play(0)
		


func set_type(type):
	emit_signal("type_setted", type)
	
func set_origin(orig):
	origin = orig
	emit_signal("set_origin", orig)
	
func get_origin():
	return origin
	
	
func set_cardData(data):
	emit_signal("set_cardData", data)


	
func set_cardType(type):
	emit_signal("set_cardType", type)
	
func set_cardId(id):
	emit_signal("set_cardId", id)
	
func save_rewardSkip(reward):
	emit_signal("set_rewardSkip", reward)
	
func set_cardTypeName(name):
	#print("saving type: ", name)
	emit_signal("set_cardTypeName", name)
	


	


