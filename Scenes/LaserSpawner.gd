extends Timer

#preload scenes
var laser_scene = preload("res://Objects/laser.tscn")
var warning_scene = preload("res://Objects/laser_warning.tscn")
var spawner_pool = []

var rng = RandomNumberGenerator.new()

#ATTENTION: should be changed to false after created rogue-like component
@export var can_spawn_vertical_array_laser : bool = false
@export var can_spawn_horizontal_array_laser : bool = false
@export var can_spawn_ratated_laser : bool = false

func _ready():
	# initialize spawner_pool
	spawner_pool = ["horizontal_laser", "vertical_laser"]
	
	if(can_spawn_ratated_laser): spawner_pool.append("ratated_laser")
	if(can_spawn_horizontal_array_laser): spawner_pool.append("horizontal_array_laser")
	if(can_spawn_vertical_array_laser): spawner_pool.append("vertical_array_laser")



func _on_timeout():
	# update spawner pool
	if(can_spawn_ratated_laser): spawner_pool.append("ratated_laser")
	if(can_spawn_horizontal_array_laser): spawner_pool.append("horizontal_array_laser")
	if(can_spawn_vertical_array_laser): spawner_pool.append("vertical_array_laser")
	
	var rand_index = randi_range(0, spawner_pool.size()-1)
	
	if(spawner_pool[rand_index] == "horizontal_laser"): spawn_laser()
	if(spawner_pool[rand_index] == "vertical_laser"): spawn_laser(90)
	if(spawner_pool[rand_index] == "ratated_laser"):
		var rotated = rng.randi_range(0, 180)
		spawn_laser(rotated)
	if(spawner_pool[rand_index] == "horizontal_array_laser"):
		var spacing = 150
		for i in range(1, 10):
			spawn_laser(0, 0, -500 + (spacing * i))
			await get_tree().create_timer(0.3).timeout
	if(spawner_pool[rand_index] == "vertical_array_laser"):
		var spacing = 150
		for i in range(1, 20):
			spawn_laser(90, -1000 + (spacing * i), 0)
			await get_tree().create_timer(0.3).timeout

func spawn_laser(rotated: float = 0, positon_x: float = 0, position_y: float = 0):
	#showing laser range for 1.5 seconds
	var warning = warning_scene.instantiate()
	warning.rotation_degrees = rotated
	warning.position = Vector2(positon_x, position_y)
	
	get_tree().current_scene.call_deferred('add_child',warning)
	await get_tree().create_timer(1.5).timeout
	warning.queue_free()
	
	#firing laser
	var laser = laser_scene.instantiate()
	laser.rotation_degrees = rotated
	laser.position = Vector2(positon_x, position_y)
	
	get_tree().current_scene.call_deferred('add_child',laser)
