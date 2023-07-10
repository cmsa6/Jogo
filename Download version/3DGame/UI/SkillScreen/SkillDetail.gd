extends VBoxContainer

onready var quantity = $Details/Quantity

func update_value(val):
	get_node("Details/Quantity").text = str(val)

