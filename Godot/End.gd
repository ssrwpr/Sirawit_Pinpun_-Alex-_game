extends Control

# Button to main menu
func _on_back_pressed():
	get_tree().change_scene_to_file("res://Menu.tscn")

# Button to quit the game
func _on_quit_pressed():
	get_tree().quit()
