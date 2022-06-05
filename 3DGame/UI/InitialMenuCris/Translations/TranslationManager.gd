extends Node

export(NodePath) var howMany

export(NodePath) var player1
export(NodePath) var player2
export(NodePath) var player3
export(NodePath) var player4




func _ready():
	translate(SettingsManager.language)
	
func translate(language):
	var howManyText = get_node(howMany)
	
	var player1Text = get_node(player1)
	var player2Text = get_node(player2)
	var player3Text = get_node(player3)
	var player4Text = get_node(player4)
			
	if language == "el":
		howManyText.text = "Πόσοι παίκτες θα παίξουν;"
		
		player1Text.text = "1\nΠαίκτης"
		player2Text.text = "2\nΠαίκτες"
		player3Text.text = "3\nΠαίκτες"
		player4Text.text = "4\nΠαίκτες"
		
	elif language == "es":
		howManyText.text = "¿Cuántos jugadores van a jugar?"
		
		player1Text.text = "1\nJugador"
		player2Text.text = "2\nJugadores"
		player3Text.text = "3\nJugadores"
		player4Text.text = "4\nJugadores"
		
	elif language == "it":
		howManyText.text = "Quanti giocatori giocheranno?"
		
		player1Text.text = "1\nGiocatore"
		player2Text.text = "2\nGiocatori"
		player3Text.text = "3\nGiocatori"
		player4Text.text = "4\nGiocatori"
	
	elif language == "pt":
		howManyText.text = "Quantos jogadores vão jogar?"
		
		player1Text.text = "1\nJogador"
		player2Text.text = "2\nJogadores"
		player3Text.text = "3\nJogadores"
		player4Text.text = "4\nJogadores"
		
		
		
