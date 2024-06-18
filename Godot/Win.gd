extends Control
@onready var global = get_node("/root/Global")


func _nextlevel():
	global.next_level += 1
	get_tree().change_scene_to_file(global.levels[global.next_level])
	
func _playagain():
	global.next_level += 0
	get_tree().change_scene_to_file(global.levels[global.next_level])
