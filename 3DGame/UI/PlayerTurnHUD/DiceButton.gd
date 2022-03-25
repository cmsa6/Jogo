extends TextureButton

onready var animPlayer = $AnimationPlayer


const VISIBLE = Color(1, 1, 1, 1)
const HIDDEN = Color(1, 1, 1, 0)


func _input(event):
	#if not self.modulate == HIDDEN:
	if not self.disabled:
		if event.is_action_pressed("ui_accept"):
			emit_signal("pressed")
		

func show_dice_screen():
	var root_node = get_node("/root")

	var playScreen = load("res://UI/Dice/NewDicePreview.tscn")
	var play_node = playScreen.instance()
	root_node.add_child(play_node)
	root_node.move_child(play_node,0)

	

	
func blink():
	animPlayer.play("blink")
	
	
	
func disappear():
	animPlayer.play("disappear")


func _on_DiceButton_mouse_entered():
	#if not disabled:
	if self.modulate == VISIBLE:
		animPlayer.play("Still")



func _on_DiceButton_mouse_exited():
	#if not disabled:
	if self.modulate == VISIBLE:
		animPlayer.play("blink")
		
func stop():
	animPlayer.stop()
	

