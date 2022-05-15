extends TextureProgress




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func increase(newPoints):
	#For writing purposes on x/8 objects, this function receives the total points
	#the player has, not how much he gained now
	
	var oldPoints = self.value
	var pointsGained = newPoints - oldPoints
	
	self.value += pointsGained
	
	
func change_colors(role):
	var underColor
	var progressColor
	if role == "main":
		underColor =  Color8(241, 161, 109, 255)
		progressColor =  Color8(228, 99, 14, 255)
	elif role == "secondary":
		underColor =  Color8(176, 173, 171, 255)
		progressColor =  Color8(82, 79, 77, 255)
		
		
	self.set_tint_under(underColor)
	self.set_tint_progress(progressColor)



