extends Node

export(NodePath) var player1
export(NodePath) var player2
export(NodePath) var player3
export(NodePath) var player4

export(NodePath) var instructions

export(NodePath) var placeholder


export(NodePath) var chooseAvatarName



func _ready():
	translate(SettingsManager.language)
	
func translate(language):
	var player1Text          = get_node(player1)
	var player2Text          = get_node(player2)
	var player3Text          = get_node(player3)
	var player4Text          = get_node(player4)
	var instructionsText     = get_node(instructions)
	var avatarNameText       = get_node(chooseAvatarName)
	var placeholderText      = get_node(placeholder)
			
	if language == "el":
		player1Text.text      = "παίχτης "
		player2Text.text      = "παίχτης "
		player3Text.text      = "παίχτης "
		player4Text.text      = "παίχτης "
		translate_instructions()
		avatarNameText.text   = "Γράψε εδώ το όνομα του χαρακτήρα σου"
		placeholderText.set_placeholder("παίχτης ")
		
	elif language == "es":
		player1Text.text      = "Jugador"
		player2Text.text      = "Jugador "
		player3Text.text      = "Jugador "
		player4Text.text      = "Jugador "
		translate_instructions()
		avatarNameText.text   = "Escribe aquí el nombre de tu personaje"
		placeholderText.set_placeholder("Jugador ")
		
	elif language == "it":
		player1Text.text      = "Giocatore "
		player2Text.text      = "Giocatore "
		player3Text.text      = "Giocatore "
		player4Text.text      = "Giocatore "
		translate_instructions()
		avatarNameText.text   = "Scrivi qui il nome del tuo personaggio"
		placeholderText.set_placeholder("Giocatore ")
	
	elif language == "pt":
		player1Text.text      = "Jogador "
		player2Text.text      = "Jogador "
		player3Text.text      = "Jogador "
		player4Text.text      = "Jogador "
		translate_instructions()
		avatarNameText.text   = "Escreve aqui o nome do teu personagem"
		placeholderText.set_placeholder("Jogador ")
		
		
func translate_instructions_name():
	var language = SettingsManager.language
	var instructionsText     = get_node(instructions)
	
	if language == "el":
		instructionsText.text = "επιλέξτε το όνομα του χαρακτήρα σας"

	elif language == "es":
		instructionsText.text = "Elige el nombre de tu personaje"

	elif language == "it":
		instructionsText.text = "Scegli il nome del tuo personaggio"

	elif language == "pt":
		instructionsText.text = "Escolhe o nome do teu personagem"
		
	elif language == "en":
		instructionsText.text = "Choose your character's name"


func translate_instructions():
	var language = SettingsManager.language
	var instructionsText     = get_node(instructions)
	
	if language == "el":
		instructionsText.text = "Επιλέξτε τον χαρακτήρα σας"

	elif language == "es":
		instructionsText.text = "Elige a tu personaje"

	elif language == "it":
		instructionsText.text = "Scegli il tuo personaggio"

	elif language == "pt":
		instructionsText.text = "Escolhe o teu personagem"
		
	elif language == "en":
		instructionsText.text = "Choose your character"
