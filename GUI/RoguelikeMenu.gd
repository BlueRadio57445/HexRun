extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	#hide()
	var canvas_rid = get_canvas_item()
	RenderingServer.canvas_item_set_z_index(canvas_rid, 100)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
