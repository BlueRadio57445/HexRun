extends Control


var score = 0

#Set as top level so this will be on top of anything else
func _ready():
	randomize()
	#set to top level so it will be ontop on everything
	var canvas_rid = get_canvas_item()
	RenderingServer.canvas_item_set_z_index(canvas_rid, 100)

func _process(delta):
	if Input.is_action_just_pressed("ui_home"):
		get_tree().root.print_tree_pretty()

#set the score
func refresh():
	$Label.text = str(score)
#reset score
func restart():
	score = 0
	refresh()
