extends Node

@export var score : Node
@export var end_menu : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func end_game():
	end_menu.show()
