extends Spatial

onready var diceContainer = $Control/DiceManager/HBoxContainer
onready var diceRes = $Control/DiceManager/HBoxContainer/DiceResumo



func _ready():
	var mapNode = get_node("/root/Map1/CanvasLayer")
	mapNode.disable_additional_info()

func show_animation():
	diceContainer.visible = false

	
	
func show_resumo():
	diceRes.visible = true
	
