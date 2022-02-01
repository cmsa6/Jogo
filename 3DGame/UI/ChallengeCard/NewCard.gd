extends Spatial


var reward = "" setget set_reward, get_reward

signal reward_changed(reward)

func _ready():
	var current_Scene = get_node("/root/CardPreview")
	current_Scene.queue_free()
	
func set_reward(rewardReceived):
	reward = rewardReceived
	emit_signal("reward_changed", reward)
	
func get_reward():
	return reward
