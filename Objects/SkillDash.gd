extends Node

# ATTENTION: this line shoul be moved to the class where manage all of rogue-like states
var can_shift_dash: bool = true
var dash_cooltime_limit = 6.0
var dash_cooltime_timer = 0
var dash_limit = 6.0
var dash_timer = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("shift_pressed") && dash_cooltime_timer <= 0 && dash_timer <= 0:
		dash_timer = dash_limit
		dash_cooltime_timer = dash_cooltime_limit
			
	if dash_timer > 0: dash_timer -= delta
	else: dash_cooltime_timer-= delta
		

func can_dash():
	return (can_shift_dash && dash_timer > 0)
