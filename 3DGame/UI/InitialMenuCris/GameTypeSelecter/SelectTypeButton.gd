extends TextureButton


onready var settings = get_node("/root/SettingsManager")

func _on_SinglePlayer_Selected():
	settings._on_SinglePlayer_Selected()

func _on_Local_Multiplayer_Selected():
	settings._on_Local_Multiplayer_Selected()


func _on_one_player_selected():
	settings.x_players_selected(1)


func _on_two_player_selected():
	settings.x_players_selected(2)
	

func _on_three_player_selected():
	settings.x_players_selected(3)

func _on_four_player_selected():
	settings.x_players_selected(4)
