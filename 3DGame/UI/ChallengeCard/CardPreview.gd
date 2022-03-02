extends Spatial

signal type_setted(type)

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
