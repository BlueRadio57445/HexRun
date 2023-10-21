extends Timer


var hex_scene = preload("res://Objects/Hex.tscn")
var rng = RandomNumberGenerator.new()
var is_previous_invert :bool = false

func _ready():
	spawn_hex(0)

func _on_HexSpawner_timeout():
	#i don't know what does this do so i'll keep it
	var r = rng.randi_range(0, 9)
	if !is_previous_invert:
		if GameManager.score.score <= 10:
			spawn_hex(0)
		elif GameManager.score.score <= 20:
			spawn_hex(0.005)
		elif GameManager.score.score <= 30:
			if r <= 5:
				spawn_hex(0, -2)
			else:
				spawn_hex(0.005)
		else:
			if r <= 5:
				spawn_hex(0.005, -2)
			else:
				spawn_hex(0.005, -2)
	else:
		is_previous_invert = false

func spawn_hex(delta_rotation,threshold = 0.1):
	var hex = hex_scene.instantiate()
	hex.rotation = randi()
	hex.delta_rotation = delta_rotation
	hex.threshold = threshold
	get_tree().current_scene.call_deferred('add_child',hex)
	if threshold <= 0:
		is_previous_invert = true
	else:
		is_previous_invert = false
	
