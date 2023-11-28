extends Timer

#preload scenes
var hex_scene = preload("res://Objects/Hex.tscn")
var hex_blue_scene = preload("res://Objects/HexBlue.tscn")
const hex_orange_scene = preload("res://Objects/HexOrange.tscn")
var spawner_pool = [hex_scene]

var rng = RandomNumberGenerator.new()
var is_previous_invert :bool = false

#ATTENTION: should be changed to false after created rogue-like component
var can_spawn_blue: bool = true
var can_spawn_orange: bool = true

func _ready():
	# initialize spawner_pool
	spawner_pool = [hex_scene]
	if(can_spawn_blue):	spawner_pool.append(hex_blue_scene)
	if(can_spawn_orange): spawner_pool.append(hex_orange_scene)
	
	spawn_hex(0)

func _on_HexSpawner_timeout():
	
	# init spawner pool
	spawner_pool = [hex_scene]
	if(can_spawn_blue):	spawner_pool.append(hex_blue_scene)
	if(can_spawn_orange): spawner_pool.append(hex_orange_scene)
	
	#i don't know what does this do so i'll keep it
	var r = rng.randi_range(0, 9)
	if !is_previous_invert:
		if GameManager.score.score <= 10:
			spawn_hex(0)
		elif GameManager.score.score <= 20:
			spawn_hex(0.005)
		elif GameManager.score.score <= 30:
			if r <= 5:
				spawn_hex(0, -2)
			else:
				spawn_hex(0.005)
		else:
			if r <= 5:
				spawn_hex(0.005, -2)
			else:
				spawn_hex(0.005, -2)
	else:
		is_previous_invert = false

func spawn_hex(delta_rotation: float,threshold = 0.1):
	# randomly spawn hex in spawner_pool
	var rand_index = randi_range(0, spawner_pool.size()-1)
	var hex = spawner_pool[rand_index].instantiate()
	
	# setting hex status
	hex.rotation = randi()
	hex.delta_rotation = delta_rotation
	hex.threshold = threshold
	get_tree().current_scene.call_deferred('add_child',hex)
	if threshold <= 0:
		is_previous_invert = true
	else:
		is_previous_invert = false
	
