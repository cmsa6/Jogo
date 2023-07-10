extends Control

onready var logo = $LogoPicture


func _ready():
	var pathLogo = "res://Logos/" + str(SettingsManager.language) + ".png"
	logo.texture = load(pathLogo)
