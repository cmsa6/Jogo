extends Node


export(NodePath) var titleNode
export(NodePath) var usernameNode
export(NodePath) var passwordNode
export(NodePath) var dialogueNode


func _ready():
	translate(SettingsManager.language)

	
func translate(language):
	var title        = get_node(titleNode)
	var username     = get_node(usernameNode)
	var password     = get_node(passwordNode)
	var dialogue     = get_node(dialogueNode)

	if language == "el":
		title.text = "Ιδιωτικός χώρος"
		username.placeholder_text = "όνομα χρήστη"
		password.placeholder_text = "Κωδικός πρόσβασης"
		dialogue.set_text("Το όνομα χρήστη και ο κωδικός δεν ταιριάζουν, παρακαλώ προσπαθήστε ξανά.\n\n\nΠαρακαλώ θυμηθείτε οτι αυτή η περιοχή χρησιμοποιείται μόνο από επαγγελματίες.")
		dialogue.window_title = "Σφάλμα"
		
		
	elif language == "es":
		title.text = "Área Privada"
		username.placeholder_text = "nombre de usuario"
		password.placeholder_text = "contraseña"
		dialogue.set_text("El nombre de usuario y la contraseña no coinciden, intente nuevamente.\n\n\nRecuerde que esta área solo está destinada a ser utilizada por profesionales.")
		dialogue.window_title = "Error"
		
		
	
	elif language == "it":
		title.text = "Area Privata"
		username.placeholder_text = "nome utente"
		password.placeholder_text = "parola d'ordine"
		dialogue.set_text("Nome utente e password non corrispondono, riprova.\n\n\nSi ricorda che quest'area è riservata all'utilizzo da parte di professionisti.")
		dialogue.window_title = "Errore"
		
		
	
	elif language == "pt":
		title.text = "Área Privada"
		username.placeholder_text = "nome de usuário"
		password.placeholder_text = "palavra-passe"
		dialogue.set_text("O nome de usuário e a palavra-passe não correspondem, por favor tente outra vez.\n\n\nNote que esta área é apenas destinada a professionais.")
		dialogue.window_title = "Erro"
		
