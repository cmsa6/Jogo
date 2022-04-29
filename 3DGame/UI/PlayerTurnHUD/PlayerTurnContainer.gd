extends VBoxContainer

#const POINTS_LABEL = " POINT"
const POINTS_LABEL = " / 8 OBJECTS"

onready var icon = $VBoxContainer2/CenterContainer/Icon
onready var button = $VBoxContainer2/CenterContainer/TextureButton
onready var label = $HBoxContainer/Label
onready var turnText = $VBoxContainer/TurnText
onready var arrow = $VBoxContainer/Arrow
onready var diceButton = $VBoxContainer2/DiceButton

onready var star1 = $HBoxContainer/Star1
onready var star2 = $HBoxContainer/Star2

onready var anim = $HBoxContainer/AnimationPlayer

const VISIBLE = Color(1, 1, 1, 1)
const HIDDEN = Color(1, 1, 1, 0)

var player setget set_player, get_player



func set_icon(new_icon):
	icon.texture = new_icon

func set_points_text(new_points):
	label.text = str(new_points) + POINTS_LABEL  
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
	arrow.modulate = HIDDEN


func hide_agency():
	#diceButton.disappear()
	button.disabled = true
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
	arrow.modulate = VISIBLE
	turnText.modulate = VISIBLE
	icon.visible = true


func EnablePLayerButton():
	if get_player() == SavingManager.current_player:
		button.disabled = false
		
func show_stars():
	anim.play("Win")
#	star1.visible = true
#	star2.visible = true
