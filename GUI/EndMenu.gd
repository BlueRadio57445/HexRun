extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	var canvas_rid = get_canvas_item()
	RenderingServer.canvas_item_set_z_index(canvas_rid, 100)
#restart game
func _on_RestartButton_pressed():
	hide()
	GameManager.score.restart()
	get_tree().reload_current_scene()


#go to menu
func _on_BackButton_pressed():
	get_tree().change_scene_to_file("res://GUI/MainMenu.tscn")
	hide()

#quit
func _on_QuitButton_pressed():
	get_tree().quit()
