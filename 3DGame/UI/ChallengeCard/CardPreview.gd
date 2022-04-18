extends Spatial

onready var audio = $AudioStreamPlayer

signal type_setted(type)

func _ready():
	audio.play(0)

func set_type(type):
#	if type == 5:
#		type = "COMMERCIAL"
#	elif type == 6:
#		type = "SERVICES"
#	elif type == 7:
#		type = "LEISURE"
#	elif type == 8:
#		type = "HELP"

	emit_signal("type_setted", type)


