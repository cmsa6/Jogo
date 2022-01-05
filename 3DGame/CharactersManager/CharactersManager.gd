extends Node

const CHAD_SCENE = preload("res://Assets/Characters/Chad/Chad.tscn")
const DOUGLAS_SCENE = preload("res://Assets/Characters/Douglas/Douglas.tscn")
const MEGAN_SCENE = preload("res://Assets/Characters/Megan/Megan.tscn")
const REGINA_SCENE = preload("res://Assets/Characters/Regina/Regina.tscn")
const REMY_SCENE = preload("res://Assets/Characters/Remy/Remy.tscn")

const CHAD_ICON = preload("res://Assets/Characters/Chad/chad-icon-165x165.png")
const DOUGLAS_ICON = preload("res://Assets/Characters/Douglas/douglas-icon-165x165.png")
const MEGAN_ICON = preload("res://Assets/Characters/Megan/megan-icon-165x165.png")
const REGINA_ICON = preload("res://Assets/Characters/Regina/regina-icon-165x165.png")
const REMY_ICON = preload("res://Assets/Characters/Remy/remy-icon-165x165.png")

# Animations
const IDLE_ANIM = "Idle"
const WALK_ANIM = "Walk"
const WIN_ANIM = "Victory"
const LOSE_ANIM = "Defeat"
const SELECTED_ANIM = "OnPlayerSelected"

enum CHARACTERS {
	CHAD = 0,
	DOUGLAS,
	MEGAN,
	REGINA
	REMY,
}

func get_character_scene(character):
	match character:
		CHARACTERS.CHAD:
			return CHAD_SCENE
		CHARACTERS.DOUGLAS:
			return DOUGLAS_SCENE
		CHARACTERS.MEGAN:
			return MEGAN_SCENE
		CHARACTERS.REGINA:
			return REGINA_SCENE
		CHARACTERS.REMY:
			return REMY_SCENE

func get_character_icon(character):
	match character:
		CHARACTERS.CHAD:
			return CHAD_ICON
		CHARACTERS.DOUGLAS:
			return DOUGLAS_ICON
		CHARACTERS.MEGAN:
			return MEGAN_ICON
		CHARACTERS.REGINA:
			return REGINA_ICON
		CHARACTERS.REMY:
			return REMY_ICON
