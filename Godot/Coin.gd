extends Area2D

@onready var global = get_node("/root/Global")

func _ready():
	pass 

func _process(delta):
	pass

# Click to collect the star	
func _collect(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		global.star += 1
		queue_free()


