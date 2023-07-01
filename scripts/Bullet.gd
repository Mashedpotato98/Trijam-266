extends KinematicBody2D

var velocity = Vector2(1,0)
var speed = 200

func _process(delta):
	$AnimationPlayer.play("Fire")
	
	var collision_info = move_and_collide(velocity.normalized()*delta*speed)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
