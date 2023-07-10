extends CenterContainer



export(CharactersManager.CHARACTERS) var character


signal new_character_selected(new_character)

onready var overlay = $TextureRect2/CenterContainer/Overlay
onready var button = $TextureRect2/CenterContainer/Button

var players_turn
var selected_by_player
var selected = false
var locked = false

func _ready():
	button.icon = CharactersManager.get_character_icon(character)

func _on_Button_pressed():
	if selected == false:
		selected = true
		overlay.visible = true
		if players_turn == 1:
			overlay.texture = load("res://Assets/Sprites/Red-circunference-200x200.png")
			selected_by_player = 1
		elif players_turn == 2:
			overlay.texture = load("res://Assets/Sprites/Blue-circunference-200x200.png")
			selected_by_player = 2
			
		emit_signal("new_character_selected", character)

func _on_PlayerSelecterContainer_player_turn_changed(new_player_turn):
	players_turn = new_player_turn

func _on_other_Button_pressed():
	if locked == false || selected_by_player == 2 && players_turn == 2:
		selected = false
		overlay.visible = false
	
func _on_ConfirmButton_pressed():
	locked =  true
	if selected == true && locked == true:
		button.disabled = true
		SettingsManager.players[selected_by_player - 1].character = character
