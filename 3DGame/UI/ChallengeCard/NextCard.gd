extends TextureButton

export(String, FILE) var nextCard


var reward="" setget save_reward, get_reward

func showNextCard():
	var root_node = get_node("/root")

	var currentCard = root_node.get_child(0)
	currentCard.queue_free()
	
	var cardScene = load(nextCard)
	var cardInstance = cardScene.instance()
	var r = get_reward()
	cardInstance.set_reward(r)
	#cardInstance.teste()
	root_node.add_child(cardInstance)
	root_node.move_child(cardInstance,0)
	
	
func save_reward(rewardReceived):
	print("set reward to ", rewardReceived)
	reward = rewardReceived
	print(reward)
	
func get_reward():
	return reward
	

