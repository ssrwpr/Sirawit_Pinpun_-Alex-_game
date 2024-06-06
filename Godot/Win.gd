extends Control
	
func _nextlevel():
		get_tree().change_scene_to_file("res://Level2.tscn")
	
func _levelgrid():
	get_tree().change_scene_to_file("res://Level_Grid.tscn")
