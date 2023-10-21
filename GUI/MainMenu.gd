extends Control

#change scene to the game scene
func _on_PlayButton_pressed():
	GameManager.game_start()
	get_tree().change_scene_to_file("res://Scenes/World.tscn")

#quit the game
func _on_QuitButton_pressed():
	get_tree().quit()
