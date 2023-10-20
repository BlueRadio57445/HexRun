extends CharacterBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var direction = Vector2.ZERO
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

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
			get_parent().get_node("EndMenu").visible = true
