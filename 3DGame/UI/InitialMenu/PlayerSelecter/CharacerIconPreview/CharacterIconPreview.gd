extends CenterContainer



#export(CharactersManager.CHARACTERS) var character
export var character = 0

signal new_character_selected(new_character)

onready var overlay = $VBoxContainer/TextureRect2/CenterContainer/Overlay
onready var button = $VBoxContainer/TextureRect2/CenterContainer/Button
#onready var keyboard = $VBoxContainer/Label
onready var playerName = $VBoxContainer/PlayerName

var players_turn
var selected_by_player 
var selected = false
var locked = false

const VISIBLE = Color(1,1,1,1)
const HIDDEN  = Color(1,1,1,0)

func _input(event):
	if event.is_action_pressed("select_avatars") and not button.disabled and get_parent().visible:
		if str(character+1) in event.as_text():
			button.avatarSelected()
		

func _ready():
	button.icon = CharactersManager.get_character_icon(character)
	playerName.modulate = HIDDEN
	
#	print("chatracter number: ", character)
#	#keyboard.text = str(character)
#	var shortcut = character + 1
#	var keyImagePath = "res://Assets/Keyboard/Tiles/" + str(shortcut) + ".png"
#	var keyImage = load(keyImagePath)
#	keyboard.texture = keyImage

func _on_Button_pressed():
	if selected == false:
		selected = true
		overlay.visible = true

		if players_turn == 1:
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
		get_parent().get_parent().set_playerID(selected_by_player)
		SettingsManager.players[selected_by_player - 1].character = character
		#playerName.visible = true
		playerName.modulate = VISIBLE
		locked = false


func get_playerName_visibility():
	#return playerName.visible
	if playerName.modulate == VISIBLE:
		return true
	else:
		return false

func get_playerName():
	return playerName.text
	
func set_playerName(name):
	playerName.text = name
	
