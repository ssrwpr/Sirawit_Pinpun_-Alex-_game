extends Area2D

@onready var global = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _collect(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		global.star -= 1
		queue_free()


