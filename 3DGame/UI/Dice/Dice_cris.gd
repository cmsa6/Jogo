extends Spatial


var rng = RandomNumberGenerator.new()

onready var anim = $AnimationPlayer


#func _ready():
	#anim.play("thrown")

func _on_Button_pressed():	
	update_dice_value()




	
func update_dice_value():
	print("helluy")
	rng.randomize()
	var dice_value = rng.randi_range(1, 6)
	
	
	dice_value = 3
	
	
	#diceText.text = "Dice = " + str(dice_value)
	#emit_signal("dice_used", dice_value)
	var gameManagerNode = get_node("/root/Map1/GameManager")
	print("calling function")
	gameManagerNode._on_Dado_dice_used(dice_value)


