extends CharacterBody2D

var speed = 200

var state_invincible = 0
	
func _physics_process(delta):
	decrease_state()
	move()
	
	print(state_invincible)
	
	

func kill_game():
	queue_free()
	GameManager.end_game()

func is_moving():
	return !(get_velocity().is_zero_approx())
	
func is_invincible():
	return state_invincible > 0
#move
func move():
	#get the direction to move, this is already normalized
	var direction = Input.get_vector('ui_left','ui_right','ui_up','ui_down')
	set_velocity(direction * speed)
	move_and_slide()
#die if we touch hex

func decrease_state():
	state_invincible -= 1
	if state_invincible < 0 : state_invincible = 0
	
func _on_HitBox_body_entered(body:Node):
	if body.is_in_group("Hex") && !is_invincible():
		kill_game()

func _on_hit_box_area_entered(area):
	if area.is_in_group("Item_Star"):
		state_invincible = 6 * 60
	
	
	if area.is_in_group("Blue") && is_moving() && !is_invincible():
		kill_game()
		
	if area.is_in_group("Orange") && !is_moving() && !is_invincible():
		kill_game()
	
	#hit by the laser
	if area.is_in_group("Laser") && !is_invincible():
		print("burned")
		kill_game()
