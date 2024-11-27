extends Control

func _ready():
	hide()
	var canvas_rid = get_canvas_item()
	RenderingServer.canvas_item_set_z_index(canvas_rid, 100)
	
	restart()
	
func _physics_process(delta):
	if LiveCount.lives == 2:
		$livePoint3.hide()
	if LiveCount.lives == 1:
		$livePoint2.hide()
	if LiveCount.lives == 0:
		$livePoint1.hide()

func restart():
	LiveCount.lives=1

func active():
	LiveCount.lives = 3
	$livePoint1.show()
	$livePoint2.show()
	$livePoint3.show()
	

