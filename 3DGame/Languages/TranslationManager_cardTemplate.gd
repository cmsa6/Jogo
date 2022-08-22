extends Node


export(NodePath) var dialogueNode

func _ready():
	translate(SettingsManager.language)



	
func translate(language):
	var dialogue   = get_node(dialogueNode)
	
	if language == "el":
		dialogue.window_title = "Παρακαλώ Επιβεβαιώστε"
		dialogue.set_text("Είστε βέβαιοι ότι θέλετε να διαγράψετε την κάρτα πρόκλησης : ")
		
	elif language == "es":
		dialogue.window_title = "Por favor confirmar"
		dialogue.set_text("¿Está seguro de que desea borrar la carta de desafío: ")
		
	elif language == "it":
		dialogue.window_title = "Si prega di confermare"
		dialogue.set_text("Sei sicuro di voler cancellare la scheda sfida: ")
				
	elif language == "pt":
		dialogue.window_title = "Por favor confirme"
		dialogue.set_text("Tem certeza de que deseja apagar a carta de desafio: ")

