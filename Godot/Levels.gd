extends Control

# Changing scene to another level
func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://Level.tscn")
	
func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://Level2.tscn")
	
func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://Level3.tscn")
