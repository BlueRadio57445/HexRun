extends Area2D

var laser_width :float= 0
@export var extend_speed :float= 20

func _ready():
	pass
	
func _init() -> void:
	scale = Vector2(1,laser_width)
	
func _physics_process(delta):
	#laser fire effect
	if laser_width < 1:
		laser_width += extend_speed * delta
		scale = Vector2(1,laser_width)
	#firing for 0.5 seconds
	await get_tree().create_timer(0.5).timeout
	queue_free()
	
