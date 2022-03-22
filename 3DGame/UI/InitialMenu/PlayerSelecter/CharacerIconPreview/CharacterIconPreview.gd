extends CenterContainer



#export(CharactersManager.CHARACTERS) var character
export var character = 0

signal new_character_selected(new_character)

onready var overlay = $VBoxContainer/TextureRect2/CenterContainer/Overlay
onready var button = $VBoxContainer/TextureRect2/CenterContainer/Button
onready var keyboard = $VBoxContainer/Label

var players_turn
var selected_by_player
var selected = false
var locked = false

func _input(event):
	if event.is_action_pressed("select_avatars"):
		print("carreguei\n\n")
		if str(character) in event.as_text():
			button.avatarSelected()
		

func _ready():
	print(character)
	button.icon = CharactersManager.get_character_icon(character)
	print("chatracter number: ", character)
	keyboard.text = str(character)

func _on_Button_pressed():
	print("Selecionei uma personagem e sou o player_turn: ", players_turn)
	if selected == false:
		selected = true
		overlay.visible = true
		print(players_turn)
		if players_turn == 1:
			print("overlay time")
			overlay.texture = load("res://Assets/Sprites/characterSelected.png")
			selected_by_player = 1
			emit_signal("new_character_selected", character)
		elif players_turn == 2:
			overlay.texture = load("res://Assets/Sprites/characterSelected.png")
			selected_by_player = 2
			emit_signal("new_character_selected", character)
		elif players_turn == 3:
			overlay.texture = load("res://Assets/Sprites/characterSelected.png")
			selected_by_player = 3
			emit_signal("new_character_selected", character)
		elif players_turn == 4:
			overlay.texture = load("res://Assets/Sprites/characterSelected.png")
			selected_by_player = 4
			emit_signal("new_character_selected", character)
			
		

func _on_PlayerSelecterContainer_player_turn_changed(new_player_turn):
	players_turn = new_player_turn

func _on_other_Button_pressed():
	
	if locked == false || selected_by_player == 2 && players_turn == 2 || selected_by_player == 3 && players_turn == 3 || selected_by_player == 4 && players_turn == 4:
		selected = false
		overlay.visible = false
	
func _on_ConfirmButton_pressed():
	locked =  true
	if selected == true && locked == true:
		button.disabled = true

		SettingsManager.players[selected_by_player - 1].character = character
