extends Control

@onready var Level = $"../"

func _on_resume_pressed():
	Level.pauseMenu()
	
func _on_quit_pressed():
	get_tree().quit()

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Menu.tscn")
