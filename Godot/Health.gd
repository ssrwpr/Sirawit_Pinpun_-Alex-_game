extends Label
# Get data from the global script
@onready var global = get_node("/root/Global")

func _ready():
	pass 

# Showing how many life the player got
func _process(delta):
	text = ("Lives: " + str(global.health))
