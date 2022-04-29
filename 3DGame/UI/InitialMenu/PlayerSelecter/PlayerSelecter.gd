extends MarginContainer

signal start_load_next_scene
signal player_turn_changed(player_turn)

export(NodePath) var player_preview_1
export(NodePath) var player_preview_2
export(NodePath) var player_preview_3
export(NodePath) var player_preview_4

var player_turn = 1

onready var confirm_button = $HBoxContainer/AvatarBody/ConfirmAvatar

func _ready():
	confirm_button.visible = false
	confirm_button.disabled = true
	
	print("no ready do menu")
	
	print(SettingsManager.language)
	
	set_player_selecter()
	
func set_player_selecter():
	print("setting new player: ", player_turn)
	if player_turn == 1:
		get_node(player_preview_1).visible = true
		get_node(player_preview_2).visible = false
		get_node(player_preview_3).visible = false
		get_node(player_preview_4).visible = false
		
	elif player_turn == 2:
		get_node(player_preview_1).visible = false
		get_node(player_preview_2).visible = true
		get_node(player_preview_3).visible = false
		get_node(player_preview_4).visible = false
		
	elif player_turn == 3:
		get_node(player_preview_1).visible = false
		get_node(player_preview_2).visible = false
		get_node(player_preview_3).visible = true
		get_node(player_preview_4).visible = false
		
	elif player_turn == 4:
		get_node(player_preview_1).visible = false
		get_node(player_preview_2).visible = false
		get_node(player_preview_3).visible = false
		get_node(player_preview_4).visible = true
		
	emit_signal("player_turn_changed", player_turn)

func _on_ConfirmButton_pressed():
	print("\n\n INCREASING PLAYER TURN")
	
	player_turn += 1
	
	print(player_turn)
	print(SettingsManager.num_of_players)
	
	if player_turn > SettingsManager.num_of_players:
		emit_signal("start_load_next_scene")
	else:
		set_player_selecter()
		
	confirm_button.disabled = true
	confirm_button.visible = false
	
	




