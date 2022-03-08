extends VBoxContainer

#const POINTS_LABEL = " POINT"
const POINTS_LABEL = " / 6 OBJETOS"

onready var icon = $VBoxContainer2/CenterContainer/Icon
onready var button = $VBoxContainer2/CenterContainer/TextureButton
onready var label = $Label
onready var turnText = $VBoxContainer/TurnText
onready var arrow = $VBoxContainer/Arrow
onready var diceButton = $VBoxContainer2/DiceButton

const VISIBLE = Color(1, 1, 1, 1)
const HIDDEN = Color(1, 1, 1, 0)

var player setget set_player, get_player



func set_icon(new_icon):
	icon.texture = new_icon

func set_points_text(new_points):
	print("helooo? im on set points: ", new_points)
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
	print("hide text")
	turnText.modulate = HIDDEN
	arrow.modulate = HIDDEN


func hide_agency():
	print("hide_agency")
	#diceButton.disappear()
	button.disabled = true
	diceButton.stop()
	#diceButton.visible = false
	diceButton.modulate = HIDDEN
	diceButton.disabled = true
	hide_turn()
	
	
func show_agency():
	print("show_agency")
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
