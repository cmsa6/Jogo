extends CanvasLayer


onready var infoPlayers = $CenterContainer/PlayerTurnHUD/VBoxContainer/HBoxContainer

signal hide_exit(bol)

func disable_canvas():
	pass

func enable_canvas():
	pass
	
func erase_text():
	var current_player = SavingManager.current_player
	var child = infoPlayers.get_child(current_player)
	child.hide_turn()
	
func disable_additional_info():
	var children = infoPlayers.get_children()
	var nChildren = children.size()
	
	for i in range(0, nChildren):
		children[i].hide_agency()
		
	emit_signal("hide_exit", true)

func enable_additional_info():	
	var current_player = SavingManager.current_player
	var child = infoPlayers.get_child(current_player)
	
	child.show_agency()
	
	emit_signal("hide_exit", false)
	


