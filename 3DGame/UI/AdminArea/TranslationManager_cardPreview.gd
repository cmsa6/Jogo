extends Node


export(NodePath) var titleNode




	
func translate(origin):
	var title   = get_node(titleNode)
	var language = SettingsManager.language
	
	if language == "el":
		if origin == "edit": title.text = "Αυτή η κάρτα πρόκλησης επεξεργάστηκε με επιτυχία"
		else: title.text = "Αυτή η κάρτα πρόκλησης δημιουργήθηκε με επιτυχία"
		
	if language == "es":
		if origin == "edit": title.text = "Esta carta de desafío fue editada con éxito"
		else: title.text = "Esta carta de desafío se creó con éxito"
		
	if language == "it":
		if origin == "edit": title.text = "Questa carta sfida è stata modificata con successo"
		else: title.text = "Questa carta sfida è stata creata con successo"
		
	if language == "pt":
		if origin == "edit": title.text = "Esta carta de desafio foi editada com sucesso"
		else: title.text = "Esta carta de desafio foi criada com sucesso"
		
	if language == "en":
		if origin == "edit": title.text = "This challenge card was edited successfully"
		else: title.text = "This challenge card was created successfully"
	
	
