extends Control




func show_zone_cards(zone):
	var root_node = get_node("/root")

	var menu = load("res://UI/AdminArea/NewCardMenu.tscn")
	var menuInstance = menu.instance()

	menuInstance.set_zone(zone)
	root_node.add_child(menuInstance)
	
