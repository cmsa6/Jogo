extends Node


export(NodePath) var dialogueNode

func _ready():
	translate(SettingsManager.language)



	
func translate(language):
	var dialogue   = get_node(dialogueNode)
	
	if language == "el":
		dialogue.window_title = "Παρακαλώ επιβεβαιώστε"
		dialogue.set_text("Είστε σίγουρος/-η οτι επιθυμείτε να διαγράψετε την κάρτα δοκιμασίας: ")
		
	elif language == "es":
		dialogue.window_title = "Por favor confirma"
		dialogue.set_text("¿Estás seguro de que quieres borrar la carte de reto: ")
		
	elif language == "it":
		dialogue.window_title = "Si prega di confermare"
		dialogue.set_text("Sei sicuro di voler cancellare la scheda sfida: ")
				
	elif language == "pt":
		dialogue.window_title = "Por favor confirme"
		dialogue.set_text("Tem certeza de que deseja apagar a carta de desafio: ")

