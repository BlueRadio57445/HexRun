extends CharacterBody2D


@export var speed :float = 100.0

var direction
var player_pos
var player_node :Node2D

func _ready():
	player_node = get_node("$../Player")

func _physics_process(delta):
	Move()

func Move():
	if player_node.global_position != null:
		player_pos = player_node.global_position
		direction = global_position.direction_to(player_pos)
		set_velocity(direction * speed)
	
		move_and_slide()
	else:
		return
