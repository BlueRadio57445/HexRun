extends Node

signal player_invicible

@export var score : Node
@export var lives : Node
@export var end_menu : Node
@export var roguelike_menu:Node
@export var function_list:Node

var button_1_function:Callable
var button_2_function:Callable
var button_3_function:Callable

var option_functions = [] # 獎池
var option_icons = []

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	option_functions.append(function_list.blue_orange_hex)
	option_functions.append(function_list.laser)
	option_functions.append(function_list.invulnerable_star)
	option_functions.append(function_list.three_lifes)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func game_start():
	score.show()
	score.restart()
	
	lives.show()
	lives.restart()
	
	$RoguelikeTimer.start()
	
func restart_game():
	end_menu.hide()
	GameManager.score.restart()
	GameManager.lives.restart()
	$RoguelikeTimer.start()
	get_tree().reload_current_scene()
	
func end_game():
	$RoguelikeTimer.stop()
	end_menu.show()

func resume_game():
	roguelike_menu.hide()
	$RoguelikeTimer.start()
	get_tree().paused = false
	pass

func _on_roguelike_timer_timeout():
	get_tree().paused = true
	# 處理獎池的問題
	button_1_function = option_functions.pick_random()
	button_2_function = option_functions.pick_random()
	button_3_function = option_functions.pick_random()
	roguelike_menu.show()
	pass # Replace with function body.
	
	
func on_roguelike_button_pressed(index:int):
	print(index)
	match index:
		1:
			button_1_function.call()
			option_functions.erase(button_1_function)
		2:
			button_2_function.call()
			option_functions.erase(button_2_function)
		3:
			button_3_function.call()
			option_functions.erase(button_3_function)
	pass
