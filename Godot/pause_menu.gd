extends Control

@onready var Level = $"../"

func _on_resume_pressed():
	Level.pauseMenu()
	
func _on_quit_pressed():
	get_tree().quit()

