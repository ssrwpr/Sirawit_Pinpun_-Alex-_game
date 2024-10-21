extends Control

# Get data from the global script
@onready var Level = get_node("/root/Node2D")

# Button to resume the game after pause
func _on_resume_pressed():
	Level._pausemenu()

# Button to quit the game
func _on_quit_pressed():
	get_tree().quit()

# Button back to the main menu
func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Menu.tscn")
