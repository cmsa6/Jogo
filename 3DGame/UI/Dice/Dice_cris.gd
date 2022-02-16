extends Spatial


var rng = RandomNumberGenerator.new()

onready var anim = $AnimationPlayer

var value setget set_value, get_value

signal update_value(diceValue)


#func _ready():
	#anim.play("thrown")


func get_dice_value():
	rng.randomize()
	var diceValue = rng.randi_range(2, 6)
	set_value(diceValue)
	print("acabei a animacao")
	emit_signal("update_value", diceValue)
	
func update_dice_value():
	#dice_value = 2
	
	var dice_value = get_value()
	#diceText.text = "Dice = " + str(dice_value)
	#emit_signal("dice_used", dice_value)
	var gameManagerNode = get_node("/root/Map1/GameManager")
	gameManagerNode._on_Dado_dice_used(dice_value)


func set_value(v):
	value = v

func get_value():
	return value

