extends CharacterBody2D


var direction = Vector2.ZERO
var speed = 100

@export var game_manager : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	direction = Vector2.ZERO
	direction.x = Input.get_action_raw_strength("ui_right") - Input.get_action_raw_strength("ui_left")
	direction.y = Input.get_action_raw_strength("ui_down") - Input.get_action_raw_strength("ui_up")
		
	direction.normalized()
	set_velocity(direction * speed)
	move_and_slide()
	
	if get_last_slide_collision() != null:
		var collider = get_last_slide_collision().get_collider()
		if collider.is_in_group("Hex"):
			queue_free()
			game_manager.get_node("EndMenu").visible = true
