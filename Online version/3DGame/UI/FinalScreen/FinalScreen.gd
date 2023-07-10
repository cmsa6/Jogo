extends Control

var scene = preload("res://UI/FinalScreen/PlayerFinalContainer.tscn")


func _ready():
	#creates a container per player that shows the player name, avatar and respective house

	var num_players = SettingsManager.num_of_players
	
	for i in range(0, num_players):
		var instance = scene.instance()
		#h_box_container.add_child(instance)
		#instance.set_icon(CharactersManager.get_character_icon(SettingsManager.players[i].character))
		instance.set_texture(CharactersManager.get_character_icon(SettingsManager.players[i].character))
		instance.set_player(i)
		i += 1


