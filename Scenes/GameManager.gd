extends Node

@export var score : Node
@export var end_menu : Node
@export var roguelike_menu:Node

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func game_start():
	score.restart()
	$RoguelikeTimer.start()

func end_game():
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
