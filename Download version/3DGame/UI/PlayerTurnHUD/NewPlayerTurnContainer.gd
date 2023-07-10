extends VBoxContainer


const POINTS_LABEL = "/8 OBJECTS"

onready var icon = $CenterContainer/Icon
onready var playerName = $TurnBackground/VBoxContainer/PlayerName
onready var button = $CenterContainer/Button
onready var label = $HBoxContainer/Objects
onready var turnText = $TurnBackground/VBoxContainer/Turn
onready var turnBack = $TurnBackground
onready var diceButton = $TurnBackground/VBoxContainer/DiceButton
onready var houseButton = $CenterContainer/Button

onready var star1 = $CenterContainer/Star1


onready var anim = $HBoxContainer/AnimationPlayer

onready var playerProgress = $CenterContainer/PlayerProgress
onready var translator = $TranslationManager


const VISIBLE = Color(1, 1, 1, 1)
const HIDDEN = Color(1, 1, 1, 0)

var player setget set_player, get_player



func set_icon(new_icon):
	icon.texture = new_icon
	
func set_name(name):
	playerName.text = name

func set_points_text(new_points):
	translator.translate_points(str(new_points))
	playerProgress.increase(new_points) 

	
func set_texture(newIcon):
	button.set_normal_texture(newIcon)


func set_player(playerID):
	player = playerID 
	button.set_playerID(playerID)


func get_player():
	return player 
	
func hide_turn():
	turnText.modulate = HIDDEN
	playerName.modulate = HIDDEN
	turnBack.modulate = HIDDEN


func hide_agency():
	button.mouse_default_cursor_shape = Control.CURSOR_ARROW
	houseButton.disabled = true
	diceButton.stop()
	diceButton.modulate = HIDDEN
	diceButton.disabled = true
	
	
	hide_turn()
	

	
	
func show_agency():
	EnablePLayerButton()
	button.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	diceButton.disabled = false
	diceButton.modulate = VISIBLE
	
	diceButton.blink()

	playerName.modulate = VISIBLE
	turnText.modulate = VISIBLE
	turnBack.modulate = VISIBLE
	



func EnablePLayerButton():
	if get_player() == SavingManager.current_player:
		houseButton.disabled = false
		
		
		
func show_stars():
	anim.play("Show star")
	star1.visible = true
	

func change_progress_colors(role):
	playerProgress.change_colors(role)
	
	
func show_icon(bol):
	icon.visible = bol

	


func hide_star():
	if button.mouse_default_cursor_shape != 0:
		star1.visible = false
	
func show_star():
	star1.visible = true
