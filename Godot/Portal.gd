extends Area2D

var portal_location = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	for portal in get_tree().get_nodes_in_group("portal"):
		if not portal == self:
			portal_location = portal.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
