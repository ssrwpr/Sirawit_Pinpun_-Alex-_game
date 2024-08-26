extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Level.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_help_pressed():
	get_tree().change_scene_to_file("res://How.tscn") 

