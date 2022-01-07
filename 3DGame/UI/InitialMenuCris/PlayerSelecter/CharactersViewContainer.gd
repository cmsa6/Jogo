extends HBoxContainer


onready var first = $CharacterIconPreview1
onready var second = $CharacterIconPreview2
onready var third = $CharacterIconPreview3
onready var four = $CharacterIconPreview4


var requested_size = Vector2(5, 5) #Input here the values that you previously got.


func _ready():
	first.set_size(requested_size)
	second.set_size(requested_size)
	third.set_size(requested_size)
	four.set_size(requested_size)
