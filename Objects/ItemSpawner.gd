extends Timer

# preload item scenes
var item_star_scene = preload("res://Scenes/item_star.tscn")
var rng = RandomNumberGenerator.new()


var spawner_pool = []

#ATTENTION: should be changed to false after created rogue-like component
var can_spawn_star: bool = true

func _on_timeout():
	
	#init spawner pool
	spawner_pool.clear()
	if (can_spawn_star): spawner_pool.append(item_star_scene)
	
	spawn_item()


func spawn_item():
	# randomly set x and y and item
	var x = rng.randi_range(-500, 500)
	var y = rng.randi_range(-300, 300)
	var rand_index = rng.randi_range(0, spawner_pool.size()-1)
	
	
	var item = spawner_pool[rand_index].instantiate()
	
	# setting hex status
	
	item.position = Vector2(x, y)
	get_tree().current_scene.call_deferred('add_child',item)
	
