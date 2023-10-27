extends CharacterBody2D

var speed = 200

	
func _physics_process(delta):
	move()
	

func kill_game():
	queue_free()
	GameManager.end_game()

func is_moving():
	return !(get_velocity().is_zero_approx())
	
#move
func move():
	#get the direction to move, this is already normalized
	var direction = Input.get_vector('ui_left','ui_right','ui_up','ui_down')
	set_velocity(direction * speed)
	move_and_slide()
#die if we touch hex

func _on_HitBox_body_entered(body:Node):
	if body.is_in_group("Hex"):
		print("white")
		kill_game()

func _on_hit_box_area_entered(area):
	if area.is_in_group("Blue") && is_moving():
		kill_game()
		
	if area.is_in_group("Orange") && !is_moving():
		kill_game()
	
	#hit by the laser
	if area.is_in_group("Laser"):
		print("burned")
		kill_game()
