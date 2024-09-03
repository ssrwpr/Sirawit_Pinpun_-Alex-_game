extends Control

func _on_mainmenu_pressed():
		get_tree().change_scene_to_file("res://Menu.tscn")

func _on_quit_pressed():
		get_tree().quit()
