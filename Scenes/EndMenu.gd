extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	var canvas_rid = get_canvas_item()
	RenderingServer.canvas_item_set_z_index(canvas_rid, 100)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_RestartButton_pressed():
	visible = false
	get_tree().reload_current_scene()


func _on_BackButton_pressed():
	visible = false
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
