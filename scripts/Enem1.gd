extends KinematicBody2D

var plr=null
var speed=27
var chase=false
var velocity=Vector2.ZERO

func _process(delta):
	if chase==true:
		position+= (plr.position - position)/speed

func _on_Detection_body_entered(body):
	plr=body
	chase=true

func _on_Detection_body_exited(body):
	plr=null
	chase=false

func _on_Hurtbox_area_entered(area):
	queue_free()
