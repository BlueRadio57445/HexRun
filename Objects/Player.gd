extends CharacterBody2D

var speed_normal = 200
var speed_dash = 500

var state_invincible = 0
@export var SkillDash :Node


func _physics_process(delta):
	decrease_state()
	move()
	
	print(state_invincible)
	
func _ready():
	GameManager.player_invicible.connect(_on_roguelike_button_pressed)

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
	var speed = speed_normal
	
	
	if SkillDash.can_dash():
		speed = speed_dash 
	set_velocity(direction * speed)
	move_and_slide()
#die if we touch hex

func decrease_state():
	state_invincible -= 1
	if state_invincible < 0 : state_invincible = 0

func _on_roguelike_button_pressed():
	state_invincible = 6 * 60
	print("成功")

func _on_HitBox_body_entered(body:Node):
	if body.is_in_group("Hex") && !is_invincible():
		kill_game()

func _on_hit_box_area_entered(area):
	if area.is_in_group("Item_Star"):
		state_invincible = 6 * 60
	
	# early return during invincible
	if is_invincible():
		return;
		
	if area.is_in_group("Blue") && is_moving():
		kill_game()
		
	if area.is_in_group("Orange") && !is_moving():
		kill_game()
	
	#hit by the laser
	if area.is_in_group("Laser"):
		print("burned")
		kill_game()
	
	if area.is_in_group("Bugger"):
		kill_game()
