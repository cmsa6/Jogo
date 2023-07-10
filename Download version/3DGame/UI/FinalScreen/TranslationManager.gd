extends Node


export(NodePath) var objects
export(NodePath) var points
export(NodePath) var qol
export(NodePath) var cf
export(NodePath) var qolPoints
export(NodePath) var cfPoints

export(NodePath) var seeDetails


func _ready():
	translate(SettingsManager.language)
	
func translate(language):
	var objectsText    = get_node(objects)
	var pointsText     = get_node(points)
	var qolText        = get_node(qol)
	var cfText         = get_node(cf)
	var qolPointsText  = get_node(qolPoints)
	var cfPointsText   = get_node(cfPoints)
	var seeDetailsText = get_node(seeDetails)
	
	
	var numObjs
	var numPoints
			
	if language == "el":
		qolText.text        = "ποιότητας ζωής"
		cfText.text         = "Γνωστικές λειτουργίες"
		seeDetailsText.text = "Δες λεπτομέρειες"
		
	elif language == "es":
		qolText.text     = "Calidad de Vida"
		cfText.text      = "Funciones Cognitivas"
		seeDetailsText.text = "Ver detalles"
		
	elif language == "it":
		qolText.text     = "Qualità di Vita"		
		cfText.text      = "Funzioni cognitive"
		seeDetailsText.text = "Vedi dettagli"

	
	elif language == "pt":
		qolText.text        = "Qualidade de Vida"
		cfText.text         = "Funções Cognitivas"
		seeDetailsText.text = "Ver Detalhes"

	
func translate_total(objs, pnts):
	var language      = SettingsManager.language

	var objectsText   = get_node(objects)
	var pointsText    = get_node(points)
	

			
	if language == "el":
		objectsText.text = objs + " Αντικείμενα"
		pointsText.text  = pnts + " Πόντοι"
		
	elif language == "es":
		objectsText.text = objs + " OBJETOS"
		pointsText.text  = pnts + " PUNTOS"
		
	elif language == "it":
		objectsText.text = objs + " OGGETTI"
		pointsText.text  = pnts + " PUNTI"

	
	elif language == "pt":
		objectsText.text = objs + " OBJETOS"
		pointsText.text  = pnts + " PONTOS"
		
	elif language == "en":
		objectsText.text = objs + " OBJECTS"
		pointsText.text  = pnts + " POINTS"


		


		
		
		
		
		
