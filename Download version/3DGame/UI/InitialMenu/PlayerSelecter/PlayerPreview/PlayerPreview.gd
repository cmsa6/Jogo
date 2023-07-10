extends ColorRect

export(NodePath) var player_placeholder
export(int) var player_num

const PLAYER_TEXT = "JOGADOR "

var player_turn

onready var player_color = $ColorRect
onready var player_label = $ColorRect/HBoxContainer/Label


		
func _ready():
	if(player_num <= SettingsManager.num_of_players):
		player_label.text = PLAYER_TEXT + str(player_num)


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
	var placeholder_node = get_node(player_placeholder)
	if( placeholder_node != null && placeholder_node.get_child_count() != 0):
#		# Delete other characters
		var numChildren = placeholder_node.get_child_count()
		for i in range(0, numChildren):
			var child = placeholder_node.get_child(i)
			if child.name == "Body":
				child.visible = false
				child.free()


