extends Node2D

# Get the player character from the player_scene scene
var player_scene = preload("res://Player_Scene.tscn")
var player = null

func _process(delta):
		if player == null:
			var new_obj = player_scene.instantiate()
			new_obj.position = position 
			get_parent().add_child(new_obj)
			player = new_obj
