extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.



func show_zone_cards(zone):
	var root_node = get_node("/root")


	#var currentCard = root_node.get_child(0)
	#currentCard.queue_free()
	

	var menu = load("res://UI/AdminArea/NewCardMenu.tscn")
	var menuInstance = menu.instance()



	menuInstance.set_zone(zone)
	root_node.add_child(menuInstance)
	
