extends Button

export(NodePath) var gameTypeSelecterContainer
export(NodePath) var playerSelecterContainer

func _process(_delta):
	if SettingsManager.game_type != null:
		self.disabled = false

func _on_ConfirmButton_pressed():
	get_node(gameTypeSelecterContainer).visible = false
	get_node(playerSelecterContainer).visible = true
	
	
