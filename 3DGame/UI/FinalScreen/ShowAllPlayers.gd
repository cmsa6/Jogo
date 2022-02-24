extends Control

var scene = preload("res://UI/FinalScreen/PlayerFinalContainer.tscn")
onready var container = $VBoxContainer/HBoxContainer

func _ready():
	#creates a container per player that shows the player name, avatar and respective house


	var map_node = get_node("/root/Map1")
	#map_node.queue_free()
	
	var num_players = SettingsManager.num_of_players
	
	for i in range(0, num_players):
		var instance = scene.instance()
		container.add_child(instance)
		#instance.set_icon(CharactersManager.get_character_icon(SettingsManager.players[i].character))
		instance.show_houses(i)
		i += 1

