extends Button



func _on_GoToExternalLink_pressed():
	OS.shell_open("http://godotengine.org")
