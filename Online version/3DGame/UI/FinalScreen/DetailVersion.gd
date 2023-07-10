extends Node

var scene =  preload("res://UI/FinalScreen/ScoreBoardDetailed.tscn")


func register_detailed_version(playerID):
	var instance = scene.instance()
	instance.visible = false
	instance.set_playerID(playerID)
	self.add_child(instance)
	
	
