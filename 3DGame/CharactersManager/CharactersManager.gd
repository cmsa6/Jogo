extends Node

const LEWIS_SCENE  = preload("res://Assets/new_characters/newLewis/newlewis.tscn")
const BRIAN_SCENE   = preload("res://Assets/new_characters/Brian/Brian.tscn")
const JOSH_SCENE = preload("res://Assets/new_characters/Josh/Josh.tscn")
const JODY_SCENE = preload("res://Assets/new_characters/Jody/Jody.tscn")
const ELIZABETH_SCENE   = preload("res://Assets/new_characters/Elizabeth/elizabeth.tscn")
const SOPHIE_SCENE = preload("res://Assets/new_characters/Sophie/Sophie.tscn")

const LEWIS_ICON = preload("res://Assets/new_characters/Lewis/Lewis.png")
const BRIAN_ICON = preload("res://Assets/new_characters/Brian/Brian.png")
const JOSH_ICON = preload("res://Assets/new_characters/Josh/Josh.png")
const JODY_ICON = preload("res://Assets/new_characters/Jody/Jody.png")
const ELIZABETH_ICON = preload("res://Assets/new_characters/Elizabeth/Elizabeth.png")
const SOPHIE_ICON = preload("res://Assets/new_characters/Sophie/Sophie.png")

# Animations
const IDLE_ANIM = "Idle"
const WALK_ANIM = "Walk"
const WIN_ANIM = "Victory"
const LOSE_ANIM = "Defeat"
const SELECTED_ANIM = "OnPlayerSelected"

enum CHARACTERS {
	LEWIS = 0,
	BRIAN,
	JOSH,
	JODY,
	ELIZABETH,
	SOPHIE,
}



func get_character_scene(character):

	match character:
		CHARACTERS.LEWIS:
			return LEWIS_SCENE
		CHARACTERS.BRIAN:
			return BRIAN_SCENE
		CHARACTERS.JOSH:
			return JOSH_SCENE
		CHARACTERS.JODY:
			return JODY_SCENE
		CHARACTERS.ELIZABETH:
			return ELIZABETH_SCENE
		CHARACTERS.SOPHIE:
			return SOPHIE_SCENE

func get_character_icon(character):
	match character:
		CHARACTERS.LEWIS:
			return LEWIS_ICON
		CHARACTERS.BRIAN:
			return BRIAN_ICON
		CHARACTERS.JOSH:
			return JOSH_ICON
		CHARACTERS.JODY:
			return JODY_ICON
		CHARACTERS.ELIZABETH:
			return ELIZABETH_ICON
		CHARACTERS.SOPHIE:
			return SOPHIE_ICON
