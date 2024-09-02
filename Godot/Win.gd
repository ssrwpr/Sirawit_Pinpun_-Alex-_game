extends Control
@onready var global = get_node("/root/Global")


func _nextlevel():
	global.next_level += 1
	if global.next_level < len(global.levels):
		get_tree().change_scene_to_file(global.levels[global.next_level])
	else:
		get_tree().change_scene_to_file("res://End.tscn")
	
func _playagain():
	global.next_level = 0
	get_tree().change_scene_to_file(global.levels[global.next_level])
