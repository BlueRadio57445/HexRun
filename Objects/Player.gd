extends CharacterBody2D

var speed_normal = 200
var speed_dash = 500
var life_count = 3

var state_invincible = 0
@export var SkillDash :Node


func _physics_process(delta):
	if LiveCount.lives == 0:
		queue_free()
		GameManager.end_game()
	
	move()
	decrease_state()
	
func _ready():
	GameManager.player_invicible.connect(_on_roguelike_button_pressed)

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
	
func decrease_state():
	state_invincible -= 1
	if state_invincible < 0:
		state_invincible = 0
		$AnimationPlayer.stop(true)	
		$AnimationPlayer.play("RESET")

#die if we touch hex
func _on_roguelike_button_pressed():
	state_invincible = 6 * 60
	$AnimationPlayer.play("RainbowShine")
	
	print("成功")
	
func  onHit():
	LiveCount.lives -= 1
	$AnimationPlayer.play("onHit")

func _on_HitBox_body_entered(body:Node):
	if body.is_in_group("Hex") && !is_invincible():
		onHit()

func _on_hit_box_area_entered(area):
	if area.is_in_group("Item_Star"):
		state_invincible = 6 * 60
		$AnimationPlayer.play("RainbowShine")
	
	# early return during invincible
	if is_invincible(): return;
	
	if area.is_in_group("Blue") && is_moving():
		onHit()
		
	if area.is_in_group("Orange") && !is_moving():
		onHit()
	
	#hit by the laser
	if area.is_in_group("Laser"):
		print("burned")
		onHit()
	
	if area.is_in_group("Bugger"):
		onHit()
