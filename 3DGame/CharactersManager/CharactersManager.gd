extends Node

const BRYCE_SCENE = preload("res://Assets/Cris_characters/Bryce/Bryce.tscn")
const LIAM_SCENE = preload("res://Assets/Cris_characters/Liam/Liam.tscn")
const MALCOM_SCENE = preload("res://Assets/Cris_characters/Malcom/Malcom.tscn")
const REGINA_SCENE = preload("res://Assets/Cris_characters/Regina/Regina.tscn")
const SHAE_SCENE = preload("res://Assets/Cris_characters/Shae/Shae.tscn")
const SOPHIE_SCENE = preload("res://Assets/Cris_characters/Sophie/Sophie.tscn")

const BRYCE_ICON = preload("res://Assets/Cris_characters/Bryce/Bryce.png")
const LIAM_ICON = preload("res://Assets/Cris_characters/Liam/Liam.png")
const MALCOM_ICON = preload("res://Assets/Cris_characters/Malcom/Malcom.png")
const REGINA_ICON = preload("res://Assets/Cris_characters/Regina/Regina.png")
const SHAE_ICON = preload("res://Assets/Cris_characters/Shae/Shae.png")
const SOPHIE_ICON = preload("res://Assets/Cris_characters/Sophie/Sophie.png")

# Animations
const IDLE_ANIM = "Idle"
const WALK_ANIM = "Walk"
const WIN_ANIM = "Victory"
const LOSE_ANIM = "Defeat"
const SELECTED_ANIM = "OnPlayerSelected"

enum CHARACTERS {
	BRYCE = 0,
	LIAM,
	MALCOM,
	REGINA,
	SHAE,
	SOPHIE,
}

func get_character_scene(character):
	match character:
		CHARACTERS.BRYCE:
			return BRYCE_SCENE
		CHARACTERS.LIAM:
			return LIAM_SCENE
		CHARACTERS.MALCOM:
			return MALCOM_SCENE
		CHARACTERS.REGINA:
			return REGINA_SCENE
		CHARACTERS.SHAE:
			return SHAE_SCENE
		CHARACTERS.SOPHIE:
			return SOPHIE_SCENE

func get_character_icon(character):
	match character:
		CHARACTERS.BRYCE:
			return BRYCE_ICON
		CHARACTERS.LIAM:
			return LIAM_ICON
		CHARACTERS.MALCOM:
			return MALCOM_ICON
		CHARACTERS.REGINA:
			return REGINA_ICON
		CHARACTERS.SHAE:
			return SHAE_ICON
		CHARACTERS.SOPHIE:
			return SOPHIE_ICON
