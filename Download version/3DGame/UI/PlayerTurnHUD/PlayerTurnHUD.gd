extends Control

# set visible = false removes the space of the element, making them misaligned
# so we change the transparency
const VISIBLE = Color(1, 1, 1, 1)
const HIDDEN = Color(1, 1, 1, 0)

signal hide_exit(bol)


var scene = preload("res://UI/PlayerTurnHUD/newPlayerContainer.tscn")

onready var h_box_container = $VBoxContainer/HBoxContainer


func _ready():
	var num_players = SettingsManager.num_of_players
	var playersNames = SavingManager.playersNames
	
	for i in range(0, num_players):
		var instance = scene.instance()
		h_box_container.add_child(instance)
		instance.set_texture(CharactersManager.get_character_icon(SettingsManager.players[i].character))
		instance.set_player(i)
		instance.set_name(playersNames[i+1])
		i += 1
	
func _on_GameManager_on_players_turn_changed(playersTurn):
	var children = $VBoxContainer/HBoxContainer.get_children()
	
	emit_signal("hide_exit", false)
	for i in children.size():
		if i != playersTurn:
			children[i].hide_agency()
			children[i].show_icon(false)
			children[i].change_progress_colors("secondary")

		else:
			children[i].show_agency()
			children[i].show_icon(true)
			children[i].change_progress_colors("main")

			
		

func _on_Player_player_points_updated(points, extra_arg_0):
	var child = $VBoxContainer/HBoxContainer.get_child(extra_arg_0 - 1)
	child.set_points_text(points)
	
	if points == 8:
		child.show_stars()
