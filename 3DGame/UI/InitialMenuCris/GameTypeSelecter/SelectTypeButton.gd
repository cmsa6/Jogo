extends TextureButton

export (int) var type

func _input(event):
	if (not self.disabled) and self.visible and event.is_action_pressed("type_selecter"):
		if str(type) in event.as_text():
			emit_signal("button_down")
			emit_signal("button_up")



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
