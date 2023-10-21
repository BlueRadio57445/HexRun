extends CharacterBody2D

var speed = 200

	
func _physics_process(delta):
	move()

#move
func move():
	#get the direction to move, this is already normalized
	var direction = Input.get_vector('ui_left','ui_right','ui_up','ui_down')
	set_velocity(direction * speed)
	move_and_slide()
#die if we touch hex
func _on_HitBox_body_entered(body:Node):
	if body.is_in_group("Hex"):
		queue_free()
		EndMenu.show()
