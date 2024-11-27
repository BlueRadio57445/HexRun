extends Node

signal player_invicible

@export var score : Node
@export var lives : Node
@export var end_menu : Node
@export var roguelike_menu:Node
@export var function_list:Node

var button_1_option
var button_2_option
var button_3_option

var option_list = [] # 獎池
var option_icons = []

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	option_list.append(
		{
			"callable":function_list.blue_orange_hex,
			"icon":load("res://Images/icon/blue_orange_hex.png")
		}
	)
	option_list.append(
		{
			"callable":function_list.laser,
			"icon":load("res://Images/icon/laser.png")
		}
	)
	option_list.append(
		{
			"callable":function_list.invulnerable_star,
			"icon":load("res://Images/icon/invulnerable_star.png")
		}
	)
	option_list.append(
		{
			"callable":function_list.invulnerable_star,
			"icon":load("res://Images/icon/invulnerable_star.png")
		}
	)
	option_list.append(
		{
			"callable":function_list.three_lifes,
			"icon":load("res://Images/icon/three_lifes.png")
		}
	)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func game_start():
	score.show()
	score.restart()
	
	$RoguelikeTimer.start()
	
func restart_game():
	end_menu.hide()
	GameManager.score.restart()
	lives.restart()
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

	# 未來再處理不要重複的問題，並且還要處理候選選項小於三個的狀況
	
	button_1_option = option_list.pick_random()
	button_2_option = option_list.pick_random()
	button_3_option = option_list.pick_random()
	roguelike_menu.change_icon(1, button_1_option["icon"])
	roguelike_menu.change_icon(2, button_2_option["icon"])
	roguelike_menu.change_icon(3, button_3_option["icon"])
	roguelike_menu.show()
	pass # Replace with function body.
	
	
func on_roguelike_button_pressed(index:int):
	print(index)
	match index:
		1:
			button_1_option["callable"].call()
			option_list.erase(button_1_option)
		2:
			button_2_option["callable"].call()
			option_list.erase(button_2_option)
		3:
			button_3_option["callable"].call()
			option_list.erase(button_3_option)
	pass
