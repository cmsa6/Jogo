extends Node


export(NodePath) var titleNode
export(NodePath) var addCardNode
export(NodePath) var menuNode
export(NodePath) var openFolderNode



func _ready():
	translate(SettingsManager.language)

	
func translate(language):
	var title      = get_node(titleNode)
	var addCard    = get_node(addCardNode)
	var menu       = get_node(menuNode)
	var openFolder = get_node(openFolderNode)


	if language == "el":
		title.text   = "Επεξεργαστής καρτών δοκιμασιών"
		addCard.text = "Προσθέστε μιακάρτα\nδοκιμασίας"
		menu.text    = "Δείτε όλες τις κάρτες δοκιμασιών"
		
		
		
	elif language == "es":
		title.text   = "Editor de cartas de retos"
		addCard.text = "Añadir\nuna carta de reto"
		menu.text    = "Ver las cartas de retos"
		
		
		
	
	elif language == "it":
		title.text      = "Editor di carte sfida"
		addCard.text    = "Aggiungi una\ncarta sfida"
		menu.text       = "Vedi tutte le\ncarte sfida"
		openFolder.text = "Apri la cartella delle\ncarte sfida"
		
		
	
	elif language == "pt":
		title.text      = "Editor de cartas de desafio"
		addCard.text    = "Adicionar\ncarta de desafio"
		menu.text       = "Ver todas as\ncartas de desafio"
		openFolder.text = "Abrir pasta com os desafios"
		
