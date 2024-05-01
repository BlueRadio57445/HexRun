extends StaticBody2D

class_name Hex

var my_scale :float= 6
var delta_scale :float= -0.8
var delta_rotation :float= 0.0
var threshold :float= 0.1
var pass_score :float= 1

func _init() -> void:
	scale = Vector2(my_scale,my_scale)
func _physics_process(delta):
	#become scaller every frame
	my_scale += delta_scale * delta
	scale = Vector2(my_scale, my_scale)
	#rotate to make it harder
	rotate(delta_rotation)
	
	if my_scale <= threshold:
		queue_free()


func _on_Score_body_entered(body:Node):
	if body.is_in_group("Player"):
		#add score if player pass it
		GameManager.score.score += pass_score
		$Score.queue_free()
