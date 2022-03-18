extends Control

var scene = preload("res://UI/FinalScreen/PlayerFinalContainer.tscn")


func _ready():
	#creates a container per player that shows the player name, avatar and respective house


	var map_node = get_node("/root/Map1")


	print("scores dos players: ", SavingManager.playersScores)
	print("scores dos players: ", SavingManager.playersScores.keys())
	var playersID = SavingManager.playersScores.keys()
	playersID.invert()
	print(playersID)

	for id in playersID:
		var instance = scene.instance()
		self.add_child(instance)

		instance.show_houses(SavingManager.playersScores[id], id)


