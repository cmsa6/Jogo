extends Node

onready var walkSound = $Walk
onready var winFemaleSound = $Win_female
onready var winMaleSound = $Win_male
onready var defeatFemaleSound = $Defeat_female
onready var defeatMaleSound = $Defeat_male


func walk():
	walkSound.play(0)
	
func win_female():
	winFemaleSound.play(0)
	
func win_male():
	winMaleSound.play(0)
	
func defeat_female():
	defeatFemaleSound.play(0)
	
func defeat_male():
	defeatMaleSound.play(0)
	

	
