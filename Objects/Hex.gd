extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var my_scale = 6
var delta_scale = 0.8

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	scale = Vector2(my_scale, my_scale)
	my_scale -= delta_scale * delta
	
	if my_scale <= 0:
		queue_free()
	


func _on_ScoreBox_body_entered(body):
	if body.is_in_group("Player"):
		Score.score += 1
		Score.update_score()
