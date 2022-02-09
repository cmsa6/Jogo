extends Spatial

onready var diceContainer = $Control/DiceManager/DiceContainer
onready var diceThrowing = $Control/DiceManager/DiceValue
onready var diceAnim = $Control/DiceManager/DiceValue/ViewportContainer/Viewport/Spatial/Spatial/object_placeHolder/dice/AnimationPlayer
onready var diceRes = $Control/DiceManager/DiceResumo

func _ready():
	var mapNode = get_node("/root/Map1/CanvasLayer")
	mapNode.disable_canvas()

func show_animation():
	diceContainer.visible = false
	diceThrowing.visible = true
	diceAnim.play("thrown")
	
	
func show_resumo():
	diceThrowing.visible = false
	diceRes.visible = true
	