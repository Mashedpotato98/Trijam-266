extends Node2D

func _process(delta):
	if !$Enem1 and $Enem2 and $Enem3 and $Enem4:
		get_tree().change_scene("res://scenes/Thanks.tscn")
