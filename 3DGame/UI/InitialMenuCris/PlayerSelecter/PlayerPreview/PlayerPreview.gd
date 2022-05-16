extends Control

export(NodePath) var player_placeholder
export(int) var player_num


var player_turn

#onready var player_color = $ColorRect
onready var player_label = $PlayerPreview/HBoxContainer/ColorRect/HBoxContainer/Label

#func init():
#	if(player_num <= SettingsManager.num_of_players):
#		#player_color.color = SettingsManager.players[player_num - 1].color
#		player_label.text = PLAYER_TEXT + str(player_num)

#func _on_ConfirmButton_pressed():
#	#when the button of the game_type is pressed
#	init()

func _ready():
	if(player_num <= SettingsManager.num_of_players):
		player_label.text = player_label.text + str(player_num) 
		

func _on_new_character_selected(character):
	var instance
	
	
	if(player_num == player_turn):
		delete_characters()
			
		# Create new character
		instance = CharactersManager.get_character_scene(character).instance()
		instance.name = "Body"
		get_node(player_placeholder).add_child(instance)
		
		# Make character Idle
		var anim = instance.get_node("AnimationPlayer")
		anim.play(CharactersManager.IDLE_ANIM)

func _on_PlayerSelecterContainer_player_turn_changed(new_player_turn):
	delete_characters()
	player_turn = new_player_turn
	


func delete_characters():
	if(get_node(player_placeholder) != null && get_node(player_placeholder).get_child_count() != 0):
		# Delete other characters
		for i in range(0, get_node(player_placeholder).get_child_count()):
			get_node(player_placeholder).get_child(i).visible = false
			get_node(player_placeholder).get_child(i).free()








