extends Control
# Get data from the global scene
@onready var global = get_node("/root/Global")

func _nextlevel():
	# Add the number to the global script to change the level
	global.next_level += 1
	# If the global script still have a level, move to the next level.
	# If not, move to the "End" scene
	if global.next_level < len(global.levels):
		get_tree().change_scene_to_file(global.levels[global.next_level])
	else:
		get_tree().change_scene_to_file("res://End.tscn")
		
# If playagain, not adding the number to global script	
func _playagain():
	global.next_level = 0
	# Stay at the same level
	get_tree().change_scene_to_file(global.levels[global.next_level])
