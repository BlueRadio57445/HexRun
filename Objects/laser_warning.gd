extends Line2D

var fade = true
var speed = 20
var time = 0
var sin_time = 0
var _visible = true

func flash():
	if !fade:
		if sin_time > 0:
			_visible = true
		else:
			_visible
	else:
		_visible = true
		modulate.a = sin_time
	visible = _visible

func _process(delta):
	time += delta
	sin_time = sin(time * speed)
	flash()
