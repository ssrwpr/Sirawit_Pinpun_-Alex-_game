extends Node2D
 
# Call pause menu, where is in the Canvaslayer
@onready var pause_menu = $CanvasLayer/PauseMenu
var paused = false

# Press pause, pause the game+ pause menu pop up
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		_pausemenu()

# Show/Hide pause menu		
func _pausemenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else: 
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = not paused
	
