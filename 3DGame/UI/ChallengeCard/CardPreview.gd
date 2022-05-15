extends Spatial

onready var audio = $AudioStreamPlayer
onready var rewardDetails = $Control/Card2/VBoxContainer/LeftSide/RewardDetails

signal type_setted(type)
signal set_origin(origin)
signal set_cardData(data)
signal set_cardType(type)

var origin = "" setget set_origin, get_origin


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
	


	


