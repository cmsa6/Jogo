extends Node2D

signal dice_used(value)

var rng = RandomNumberGenerator.new()
var canLaunchDice = true

onready var diceText = $Label
onready var button = $DiceButton

func _ready():
	diceText.text = ""



func _on_Button_pressed():
	if canLaunchDice:
		canLaunchDice = false
		button.disabled = true
		update_dice_value()

func update_dice_value():
	rng.randomize()
	var dice_value = rng.randi_range(1, 6)
	
	
	dice_value = 1
	
	
	#diceText.text = "Dice = " + str(dice_value)
	diceText.text = str(dice_value)
	emit_signal("dice_used", dice_value)
	

func SetCanLaunchDice(b):
	canLaunchDice = b
	if canLaunchDice:
		button.disabled = false

