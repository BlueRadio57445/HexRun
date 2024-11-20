extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	var canvas_rid = get_canvas_item()
	RenderingServer.canvas_item_set_z_index(canvas_rid, 100)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_icon(index,image):
	match index:
		1:
			$CenterContainer/HBoxContainer/Option1.texture_normal = image
		2:
			$CenterContainer/HBoxContainer/Option2.texture_normal = image
		3:
			$CenterContainer/HBoxContainer/Option3.texture_normal = image


func _on_option_1_button_up():
	GameManager.resume_game()
	GameManager.on_roguelike_button_pressed(1)
	pass # Replace with function body.


func _on_option_2_button_up():
	GameManager.resume_game()
	GameManager.on_roguelike_button_pressed(2)
	pass # Replace with function body.


func _on_option_3_button_up():
	GameManager.resume_game()
	GameManager.on_roguelike_button_pressed(3)
	pass # Replace with function body.
