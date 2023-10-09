extends KinematicBody2D


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
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
		
	direction.normalized()
	move_and_slide(direction * speed)
	
	if get_last_slide_collision() != null:
		var collider = get_last_slide_collision().get_collider()
		if collider.is_in_group("Hex"):
			queue_free()
			EndMenu.visible = true
