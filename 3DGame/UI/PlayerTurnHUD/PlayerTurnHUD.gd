extends Control

# set visible = false removes the space of the element, making them misaligned
# so we change the transparency
const VISIBLE = Color(1, 1, 1, 1)
const HIDDEN = Color(1, 1, 1, 0)

signal hide_exit(bol)

var scene = preload("res://UI/PlayerTurnHUD/PlayerTurnContainer.tscn")

onready var h_box_container = $VBoxContainer/HBoxContainer

func _ready():
	var num_players = SettingsManager.num_of_players
	
	for i in range(0, num_players):
		var instance = scene.instance()
		h_box_container.add_child(instance)
		#instance.set_icon(CharactersManager.get_character_icon(SettingsManager.players[i].character))
		instance.set_texture(CharactersManager.get_character_icon(SettingsManager.players[i].character))
		instance.set_player(i)
		i += 1
	
func _on_GameManager_on_players_turn_changed(playersTurn):
	print("estou a atualizar para a vez: ", playersTurn)
	var children = $VBoxContainer/HBoxContainer.get_children()
	emit_signal("hide_exit", false)
	for i in children.size():
		if i != playersTurn:
			#children[i].show_agency()
			print("player NAO atual: ", i)
			children[i].hide_agency()
#			children[i].get_node("VBoxContainer/Arrow").modulate = HIDDEN
			children[i].get_node("VBoxContainer2/CenterContainer/Icon").visible = false
#			#children[i].get_node("CenterContainer/TextureRect2").texture = null
#			children[i].get_node("VBoxContainer2/DiceButton").modulate = HIDDEN
#			children[i].get_node("VBoxContainer2/DiceButton").disabled = true
#			print(children[i].get_node("VBoxContainer2/DiceButton").disabled)
#			children[i].get_node("VBoxContainer/TurnText").modulate = HIDDEN
#			children[i].get_node("VBoxContainer2/CenterContainer/TextureButton").disabled = true



			#children[i].get_node("VBoxContainer2/DiceButton").disabled = true
			
			#children[i].get_node("CenterContainer").set_scale(Vector2(1,1))
			#children[i].get_node("Arrow").visible = false
		else:
			print("sou o player atual e vou fazer o show_agency: ", i)
			children[i].show_agency()
			#children[i].get_node("CenterContainer/TextureRect2").texture = load("res://Assets/Sprites/characterSelected.png")
			#children[i].get_node("CenterContainer").set_scale(Vector2(1.3,1.3))
			
#			children[i].show_agency()
			children[i].get_node("VBoxContainer2/CenterContainer/Icon").visible = true
#			children[i].get_node("VBoxContainer/Arrow").modulate = VISIBLE
#			children[i].get_node("VBoxContainer/TurnText").modulate = VISIBLE
#			children[i].get_node("VBoxContainer2/DiceButton").disabled = false
#			children[i].get_node("VBoxContainer2/CenterContainer/TextureButton").disabled = false
			
			#children[i].get_node("VBoxContainer2/DiceButton").visible = true
			
			#children[i].get_node("VBoxContainer2/DiceButton").blink()
			#children[i].get_node("Arrow").visible = true

func _on_Player_player_points_updated(points, extra_arg_0):
	var child = $VBoxContainer/HBoxContainer.get_child(extra_arg_0 - 1)
	child.set_points_text(points)
