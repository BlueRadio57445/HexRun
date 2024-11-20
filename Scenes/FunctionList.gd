extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func blue_orange_hex():
	print("blue_orange_hex")
	pass
	
func laser():
	print("laser")
	var laser_scene = load("res://Objects/laser_spawner.tscn")
	var laser_node = laser_scene.instantiate()
	get_tree().current_scene.add_child(laser_node)
	pass

func array_laser():
	print("array_laser")
	pass	
	
func invulnerable_star():
	print("invulnerable_star")
	pass
	
func three_lifes():
	print("three_lifes")
	pass
