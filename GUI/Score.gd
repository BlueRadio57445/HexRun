extends Control


var score:int = 0:
	get:
		return score
	set(value):
		score = value
		refresh()

#Set as top level so this will be on top of anything else
func _ready():
	hide()
	var canvas_rid = get_canvas_item()
	RenderingServer.canvas_item_set_z_index(canvas_rid, 100)

func _process(delta):
	pass

#set the score
func refresh():
	$Label.text = str(score)
#reset score
func restart():
	score = 0
