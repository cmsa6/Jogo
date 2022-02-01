extends CanvasLayer

onready var infoDice = $Dado
onready var infoPlayers = $PlayerTurnHUD


func disable_canvas():
	infoDice.visible = false
	infoPlayers.visible = false

func enable_canvas():
	#infoDice.visible = true
	infoPlayers.visible = true
	
