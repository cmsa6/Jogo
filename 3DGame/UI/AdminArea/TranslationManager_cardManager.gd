extends Node


export(NodePath) var titleNode
export(NodePath) var addCardNode
export(NodePath) var menuNode



func _ready():
	translate(SettingsManager.language)

	
func translate(language):
	var title   = get_node(titleNode)
	var addCard = get_node(addCardNode)
	var menu    = get_node(menuNode)


	if language == "el":
		title.text   = "Επεξεργαστής καρτών δοκιμασιών"
		addCard.text = "Προσθέστε μιακάρτα\nδοκιμασίας"
		menu.text    = "Δείτε όλες τις κάρτες δοκιμασιών"
		
		
		
	elif language == "es":
		title.text   = "Editor de cartas de retos"
		addCard.text = "Añadir\nuna carta de reto"
		menu.text    = "Ver las cartas de retos"
		
		
		
	
	elif language == "it":
		title.text   = "Editor di carte sfida"
		addCard.text = "Aggiungi la\ncarta sfida"
		menu.text    = "Vedi tutte le\ncarte sfida"
		
		
		
	
	elif language == "pt":
		title.text   = "Editor de cartas de desafio"
		addCard.text = "Adicionar\ncarta de desafio"
		menu.text    = "Ver todas as\ncartas de desafio"
		
