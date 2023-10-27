extends Timer

#preload scenes
var laser_scene = preload("res://Objects/laser.tscn")
var warning_scene = preload("res://Objects/laser_warning.tscn")

func _ready():
	pass # Replace with function body.



func _on_timeout():
	spawn_laser()

func spawn_laser():
	#showing laser range for 1.5 seconds
	var warning = warning_scene.instantiate()
	get_tree().current_scene.call_deferred('add_child',warning)
	await get_tree().create_timer(1.5).timeout
	warning.queue_free()
	#firing laser
	var laser = laser_scene.instantiate()
	get_tree().current_scene.call_deferred('add_child',laser)
