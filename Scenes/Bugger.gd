extends CharacterBody2D


@export var speed :float = 100.0

var direction
var player_node :Node2D

func _ready():
	player_node = get_node("/root/World/Player")
	position = Vector2(575, 325)

func _physics_process(delta):
	Move()

func Move():
	if has_node("/root/World/Player"):
		direction = global_position.direction_to(player_node.global_position)
		set_velocity(direction * speed)
	
		move_and_slide()
	else:
		return
