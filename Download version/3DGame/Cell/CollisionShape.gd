extends CollisionShape

onready var light = get_node("OmniLight")

func light_on():
	light.visible = true
	
func light_off():
	light.visible = false
