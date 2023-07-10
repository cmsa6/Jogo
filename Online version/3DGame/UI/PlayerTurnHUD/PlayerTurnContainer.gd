extends VBoxContainer

#const POINTS_LABEL = " POINT"
const POINTS_LABEL = " / 8 OBJECTS"

onready var icon = $VBoxContainer2/CenterContainer/Icon
onready var playerName = $VBoxContainer2/Control/VBoxContainer/PlayerName
onready var button = $VBoxContainer2/CenterContainer/TextureButton
onready var label = $HBoxContainer/Label
onready var turnText = $VBoxContainer2/Control/VBoxContainer/TurnText
#onready var arrow = $VBoxContainer2/Control/TurnBackground/VBoxContainer/Arrow
onready var turnBack = $VBoxContainer2/Control/TurnBackground
onready var diceButton = $VBoxContainer2/DiceButton
onready var houseButton = $VBoxContainer2/CenterContainer/Button

onready var star1 = $HBoxContainer/Star1
onready var star2 = $HBoxContainer/Star2

onready var anim = $HBoxContainer/AnimationPlayer

onready var playerProgress = $VBoxContainer2/CenterContainer/PlayerProgress
onready var translator = $TranslationManager


const VISIBLE = Color(1, 1, 1, 1)
const HIDDEN = Color(1, 1, 1, 0)

var player setget set_player, get_player


func ready():
	translator.translate_points(0)



func set_icon(new_icon):
	icon.texture = new_icon
	
func set_name(name):
	playerName.text = name

func set_points_text(new_points):
	#label.text = str(new_points) + POINTS_LABEL 
	translator.translate_points(str(new_points))
	playerProgress.increase(new_points) 
	#if new_points < 10:
	#	label.text = str(new_points) + POINTS_LABEL + "S"
	#else:
	#	label.text = str(new_points) + POINTS_LABEL
	
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
	#arrow.modulate    = HIDDEN
	turnBack.modulate = HIDDEN


func hide_agency():
	#diceButton.disappear()
	#button.disabled = true
	houseButton.disabled = true
	diceButton.stop()
	#diceButton.visible = false
	diceButton.modulate = HIDDEN
	diceButton.disabled = true
	
	
	hide_turn()
	
	
func show_agency():
	EnablePLayerButton()
	#diceButton.visible = true
	diceButton.disabled = false
	diceButton.modulate = VISIBLE
	
	diceButton.blink()
#
	#arrow.modulate    = VISIBLE
	playerName.modulate = VISIBLE
	turnText.modulate = VISIBLE
	turnBack.modulate = VISIBLE
	
	
	


func EnablePLayerButton():
	if get_player() == SavingManager.current_player:
		#button.disabled = false
		houseButton.disabled = false
		
func show_stars():
	anim.play("Win")
#	star1.visible = true
#	star2.visible = true

func change_progress_colors(role):
	playerProgress.change_colors(role)

func show_icon(bol):
	icon.visible = bol
