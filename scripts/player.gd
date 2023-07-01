extends KinematicBody2D

var spd = 7
onready var bull = preload("res://scenes/Bullet.tscn")
var timer = 10000

func _process(delta):
	#movement
	$AnimationPlayer.play("Right")
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x = spd

	if Input.is_action_pressed("ui_left"):
		velocity.x = -spd

	if Input.is_action_pressed("ui_down"):
		velocity.y = spd

	if Input.is_action_pressed("ui_up"):
		velocity.y = -spd
#shooting
	$Node2D.look_at(get_global_mouse_position())

	if Input.is_action_pressed("shooot") and timer > 0:
		var bull_ins=bull.instance()
		get_parent().add_child(bull_ins)
		bull_ins.position = $Node2D/Position2D.global_position
		bull_ins.velocity = get_global_mouse_position() - bull_ins.position
		Global.ammo_health -= 1
#health
	if Global.health <= 0:
		get_tree().reload_current_scene()
		Global.health = 20
	if Global.ammo_health <= 0:
		get_tree().reload_current_scene()
		Global.ammo_health = 120

	move_and_collide(velocity)

func _on_Hurtbox_area_entered(area):
	Global.health -= 1
