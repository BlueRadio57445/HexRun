extends Node

@export var lives : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func blue_orange_hex():
	print("blue_orange_hex")
	get_tree().current_scene.get_node("HexSpawner").can_spawn_blue = true
	get_tree().current_scene.get_node("HexSpawner").can_spawn_orange = true
	pass
	
func laser():
	print("laser")
	var laser_scene = load("res://Objects/laser_spawner.tscn")
	var laser_node = laser_scene.instantiate()
	get_tree().current_scene.add_child(laser_node)
	
	GameManager.option_list.append(
		{
			"callable":array_laser,
			"icon":load("res://Images/icon/array_laser.png")
		}
	)
	pass

func array_laser():
	print("array_laser")
	get_tree().current_scene.get_node("LaserSpawner").can_spawn_vertical_array_laser = true
	get_tree().current_scene.get_node("LaserSpawner").can_spawn_horizontal_array_laser = true
	pass	
	
func invulnerable_star():
	print("invulnerable_star")
	get_tree().current_scene.get_node("ItemSpawner").can_spawn_star = true
	pass
	
func three_lifes():
	print("three_lifes")
	lives.show()
	lives.active()
	pass
