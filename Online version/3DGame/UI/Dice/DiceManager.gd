extends ColorRect

export(NodePath) var translationManager

onready var diceResumoAvatar = $HBoxContainer/VBoxContainer/Avatar
onready var diceAnim = $HBoxContainer/DiceResumo/VBoxContainer/ViewportContainer/Viewport/Spatial/Spatial/object_placeHolder/Roll/Spatial/AnimationPlayer
onready var playerName = $HBoxContainer/DiceResumo/PlayerName
onready var roll = $HBoxContainer/DiceResumo/VBoxContainer/ViewportContainer/Viewport/Spatial/Spatial/object_placeHolder/Roll


onready var instructions = $HBoxContainer/DiceResumo/VBoxContainer/Instructions
onready var button = $HBoxContainer/VBoxContainer/VBoxContainer/MapButton


const VISIBLE = Color(1, 1, 1, 1)
const HIDDEN = Color(1, 1, 1, 0)

var rng = RandomNumberGenerator.new()

func _ready():
	instructions.modulate = HIDDEN
	button.modulate = HIDDEN
	
	var current_player = SavingManager.current_player
	diceResumoAvatar.set_texture(CharactersManager.get_character_icon(SettingsManager.players[current_player].character))
	#playerName.text = "Jogador " + str(current_player + 1)
	
	playerName.text = SavingManager.playersNames[current_player + 1]
#	if name == "" or name == " ":
#		playerName.text = "Jogador " + str(current_player + 1)
#	else:
#		playerName.text = name
	#diceAnim.play("thrown")
	
	rng.randomize()
	
	var diceValue = rng.randi_range(1, 6)
	
#	var diceValue = 4
	
	var animName = "Roll_" + str(diceValue)
	roll.set_value(diceValue)
	diceAnim.play(animName)
	





	



func update_text(value):
	#instructions.text = "Is gonna walk " + str(value) + " steps"
	get_node(translationManager).translate(str(value))
	instructions.modulate = VISIBLE
	button.modulate = VISIBLE
	button.disabled = false
	
