extends Node

signal player_invicible

@export var score : Node
@export var lives : Node
@export var end_menu : Node
@export var roguelike_menu:Node
@export var function_list:Node

var option_functions = []
var option_icons = []

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
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
	roguelike_menu.show()
	pass # Replace with function body.
	
	
func on_roguelike_button_pressed():
	emit_signal("player_invicible")
