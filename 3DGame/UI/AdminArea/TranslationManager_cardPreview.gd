extends Node


export(NodePath) var titleNode




	
func translate(origin):
	var title   = get_node(titleNode)
	var language = SettingsManager.language
	
	if language == "el":
		if origin == "edit": title.text = "Η επεξεργασία της κάρτας δοκιμασίας πραγματοποιήθηκε επιτυχώς"
		else: title.text = "Η κάρτα δοκιμασίας δημιουργήθηκε επιτυχώς"
		
	if language == "es":
		if origin == "edit": title.text = "Esta cara de reto se ha editado exitosamennte"
		else: title.text = "Esta carta de reto se ha creado exitosamente"
		
	if language == "it":
		if origin == "edit": title.text = "Questa carta sfida è stata modificata con successo"
		else: title.text = "Questa carta sfida è stata creata con successo"
		
	if language == "pt":
		if origin == "edit": title.text = "Esta carta de desafio foi editada com sucesso"
		else: title.text = "Esta carta de desafio foi criada com sucesso"
		
	if language == "en":
		if origin == "edit": title.text = "This challenge card was edited successfully"
		else: title.text = "This challenge card was created successfully"
	
	
