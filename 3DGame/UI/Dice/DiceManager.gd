extends ColorRect

onready var diceResumoAvatar = $DiceResumo/HBoxContainer/Avatar
onready var diceAnim = $DiceResumo/CenterContainer/ViewportContainer/Viewport/Spatial/Spatial/object_placeHolder/dice/AnimationPlayer
onready var playerName = $DiceResumo/HBoxContainer/PlayerName

onready var instructions = $DiceResumo/Instructions
onready var button = $DiceResumo/MapButton

const VISIBLE = Color(1, 1, 1, 1)
const HIDDEN = Color(1, 1, 1, 0)


func _ready():
	instructions.modulate = HIDDEN
	var current_player = SavingManager.current_player
	diceResumoAvatar.set_texture(CharactersManager.get_character_icon(SettingsManager.players[current_player].character))
	playerName.text = "Jogador " + str(current_player + 1)
	
	diceAnim.play("thrown")
	





	



func update_text(value):
	print("hello")
	instructions.text = "Vai andar " + str(value) + " vezes"
	instructions.modulate = VISIBLE
	button.disabled = false
