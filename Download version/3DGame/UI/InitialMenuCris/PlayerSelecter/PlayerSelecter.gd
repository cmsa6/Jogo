extends MarginContainer

signal start_load_next_scene
signal player_turn_changed(player_turn)

export(NodePath) var player_preview_1
export(NodePath) var player_preview_2

var player_turn = 1

onready var confirm_button = $VBoxContainer/ConfirmButton

func _ready():
	confirm_button.visible = true
	confirm_button.disabled = true
	
	set_player_selecter()
	
func set_player_selecter():
	if player_turn == 1:
		get_node(player_preview_1).visible = true
		get_node(player_preview_2).visible = false
		emit_signal("player_turn_changed", player_turn)
	elif player_turn == 2:
		get_node(player_preview_1).visible = false
		get_node(player_preview_2).visible = true
		emit_signal("player_turn_changed", player_turn)

func _on_ConfirmButton_pressed():
	player_turn += 1
	
	if player_turn > SettingsManager.num_of_players:
		emit_signal("start_load_next_scene")
	else:
		set_player_selecter()
		
	confirm_button.disabled = true
