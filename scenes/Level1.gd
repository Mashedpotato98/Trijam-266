extends Node2D


func _process(delta):
	if !$Enem2 and $Enem1:
		get_tree().change_scene("res://scenes/Level2.tscn")
