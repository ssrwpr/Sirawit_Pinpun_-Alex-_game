extends CanvasLayer

@onready var global = get_node("/root/Global")

func _ready():
	pass 

# GUI for star and live for user to see
func _process(delta):
	$Star.text = ("Star: " + str(global.star))
	$Lives.text = ("Lives " + str(global.health))	
