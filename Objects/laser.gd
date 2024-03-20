extends Area2D

var laser_width :float= 0 # 初始宽度
var laser_length = 200 # 雷射长度
var tween_duration = 1.0  # 动画持续时间（秒）
@export var extend_speed :float= 20

func _ready():
	var animation_player = $AnimationPlayer
	animation_player.play("laser_animation")
	
	# 连接动画完成信号

# 动画完成时的回调函数
func _on_animation_finished(animation_name: String):
	print("Animation finished:", animation_name)

	
func _init() -> void:
	pass
#	scale = Vector2(1,laser_width)

func _physics_process(delta):
	pass
#	#laser fire effect
#	if laser_width < 1:
#		laser_width += extend_speed * delta
#		scale = Vector2(1,laser_width)
	#firing for 0.5 seconds
	await get_tree().create_timer(0.7).timeout
	queue_free()
	
