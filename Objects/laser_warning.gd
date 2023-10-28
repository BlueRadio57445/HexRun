extends Line2D

@export var speed = 20
var time = 0

func _process(delta):
	time += delta
	modulate.a = sin(time * speed)
